<?php
/*****************************
This script contacts and grabs currency data from oanda
useful for ecommerce 
run on a crontab or command line to update db table
*****************************/
require_once('site.php'); // uses a file for db connectivity, nothing fancy. You may have to do your own thingy here
// Function for the oanda server
  function quote_oanda_currency($code, $base = DEFAULT_CURRENCY) {
    $page = file('http://www.oanda.com/convert/fxdaily?value=1&redirected=1&exch=' . $code .  '&format=CSV&dest=Get+Table&sel_list=' . $base);
    $match = array();
    preg_match('/(.+),(\w{3}),([0-9.]+),([0-9.]+)/i', implode('', $page), $match);
    if (sizeof($match) > 0) {
      return $match[3];
    } else {
      return false;
    }
  }
// Function for the xe server
  function quote_xe_currency($to, $from = DEFAULT_CURRENCY) {
    $page = file('http://www.xe.net/ucc/convert.cgi?Amount=1&From=' . $from . '&To=' . $to);
    $match = array();
    preg_match('/[0-9.]+\s*' . $from . '\s*=\s*([0-9.]+)\s*' . $to . '/', implode('', $page), $match);
    if (sizeof($match) > 0) {
      return $match[1];
    } else {
      return false;
    }
  }

  // define default currency
define('DEFAULT_CURRENCY', 'USD');
define('TABLE_CURRENCIES', 'currencies');
// Define currency servers
define('CURRENCY_SERVER_PRIMARY', 'oanda');
define('CURRENCY_SERVER_BACKUP', 'xe');

$sql = "SELECT currencies_id, code FROM " . TABLE_CURRENCIES;

diode($currency_query = $db->query($sql), $sql); // db conn wrapper

while ($currency = $currency_query->fetchRow()) {
  $quote_function = 'quote_' . CURRENCY_SERVER_PRIMARY . '_currency';
  $rate = $quote_function($currency['code']);
  if ( (!$rate) && (CURRENCY_SERVER_BACKUP != '') ) {
	$quote_function = 'quote_' . CURRENCY_SERVER_BACKUP . '_currency';
	$rate = $quote_function($currency['code']);
  }
  
  if ($rate) {
	$sql = "UPDATE " . TABLE_CURRENCIES . " SET value = '" . $rate . "', last_updated = now() 
	       WHERE currencies_id = '" . $currency['currencies_id'] . "'";
	diode($db->query($sql), $sql);	
  }
}

mysql_close();

