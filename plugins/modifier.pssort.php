<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Smarty {pssort} function plugin
 *
 * Type:     function
 * Name:     pshook
 * Purpose:  call a Prestashop hook directly from a template file
 * @author Clément Hallet <clement@prestarocket.com>
 * @link https://github.com/challet/smarty-pshook
 * @param array parameters
 * @param Smarty
 * @return string|null
 */
function smarty_modifier_pssort($array)
{
   usort($array, function ($a, $b) {
     return (strtolower($a['name']) < strtolower($b['name'])) ? -1 : 1;
   });
   return $array;   
}


?>