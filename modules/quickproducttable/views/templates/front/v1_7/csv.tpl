{*
* 2007-2021 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2021 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{extends file=$layout}
{block name='content'}
<h1 class="quickhead csvhead">{$head_name_{$id_lang}|escape:'htmlall':'UTF-8'}</h1>
{if isset($count) AND $count > 0}
    <div class="alert alert-success" role="alert">
  {$count|escape:'htmlall':'UTF-8'}{l s=' Products Successfully Added' mod='quickproducttable'}
</div>
{/if}
{if $in_ary == true}
<div class="fmmpanel border-2 border-solid border-main rounded-[4px]">
  <div class="bg-gray-normal  mb-10 rounded-lg col-lg-10">
  <div class="col-lg-1 col-xs-12 top_buttons">
        <p style="padding-top: 8px;font-weight: bolder;">{l s='Filters:' mod='quickproducttable'}</p>
        
    </div>
{if $new_enable == 1}
<div class="col-lg-2 col-xs-12 top_buttons" >
    <a class="border-0 rounded-[4px] bg-black py-3 hover:bg-main transition btn btn-{$btn_clr|escape:'htmlall':'UTF-8'}" href="{$base_url|escape:'htmlall':'UTF-8'}{$route_name|escape:'htmlall':'UTF-8'}?product_type=new">{l s='New Products' mod='quickproducttable'}</a>
</div>
{/if}
{if $best_enable == 1}
<div class="col-lg-2 col-xs-12 top_buttons" >
    <a class="border-0 rounded-[4px] bg-black py-3 hover:bg-main transition btn btn-{$btn_clr|escape:'htmlall':'UTF-8'}" href="{$base_url|escape:'htmlall':'UTF-8'}{$route_name|escape:'htmlall':'UTF-8'}?product_type=best">{l s='Best Sales' mod='quickproducttable'}</a>
</div>
{/if}
{if $all_enable == 1}
<div class="col-lg-2 col-xs-12 top_buttons">
    <a class="border-0 rounded-[4px] bg-black py-3 hover:bg-main transition btn btn-{$btn_clr|escape:'htmlall':'UTF-8'}" href="{$base_url|escape:'htmlall':'UTF-8'}{$route_name|escape:'htmlall':'UTF-8'}?product_type=all">{l s='All Products' mod='quickproducttable'}</a>
</div>
{/if}
{if $sale_enable == 1}
<div class="col-lg-2 col-xs-12 top_buttons">
    <a class="border-0 rounded-[4px] bg-black py-3 hover:bg-main transition btn btn-{$btn_clr|escape:'htmlall':'UTF-8'}" href="{$base_url|escape:'htmlall':'UTF-8'}{$route_name|escape:'htmlall':'UTF-8'}?product_type=sale">{l s='Prices Drop' mod='quickproducttable'}</a>
</div>
{/if}

{if $advance_enable == 1}
<div class="col-lg-3 col-xs-12 top_buttons">
    <a class="border-0 rounded-[4px] bg-main py-3 hover:bg-black transition btn btn-{$btn_clr|escape:'htmlall':'UTF-8'}" href="{$base_url|escape:'htmlall':'UTF-8'}{$route_name|escape:'htmlall':'UTF-8'}?product_type=advance">
        <svg class="mr-1 inline-block" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="width: 18px;">
	    	<path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z" fill="#fff"></path>
	    </svg>
    {l s='Advance Search' mod='quickproducttable'}</a>
</div>
{/if}
</div>

{if $csv_enable == 1}
<div class="col-lg-2 col-xs-12 top_buttons">
    <a class="border-0 rounded-[4px] bg-main py-3 hover:bg-black transition btn btn-{$btn_clr|escape:'htmlall':'UTF-8'}" href="{$base_url|escape:'htmlall':'UTF-8'}{$route_name|escape:'htmlall':'UTF-8'}?product_type=csv">{l s='Add In Bulk' mod='quickproducttable'}</a>
</div>
{/if}
 <input type="hidden" name="ajax_url" id="ajax_url" value="{$ajax_url|escape:'htmlall':'UTF-8'}">
<div class="clearfix"></div>

<div class="col-lg-12 center">
    <h6 class="csvhead">{l s='Add Products Using CSV' mod='quickproducttable'}</h6>
</div>
<div class="col-lg-6" style="margin-top: 40px;">
<form action="" method="POST" enctype="multipart/form-data">
         <input type="file" name="quickcsv" />
         <input class="border-2 border-solid border-main rounded-[4px] px-4 mt-2 hover:bg-main active:bg-main btn btn-{$btn_clr|escape:'htmlall':'UTF-8'}" value="Submit" type="submit"/>
      </form>
    <p id="downloadcsvfile"><a href="{$base_url|escape:'htmlall':'UTF-8'}modules/quickproducttable/views/img/sample.csv">{l s='Download a sample CSV file' mod='quickproducttable'}</a>
    </p>
</div>
<div class="col-lg-6 center">
    <textarea id="csv_sku" placeholder="{l s='Enter multiple reference, separate by new lines' mod='quickproducttable'}" style="height: 93px;"></textarea>
    <p>{l s='Format: reference,qty,attribute' mod='quickproducttable'}</p>
    <p>{l s='e.g demo_1,2,1' mod='quickproducttable'}</p>
    <p>{l s='e.g demo_10,5' mod='quickproducttable'}</p>
    <input class=" border-2 border-solid border-main rounded-[4px] px-4 mt-2 hover:bg-main active:bg-main btn btn-{$btn_clr|escape:'htmlall':'UTF-8'}"  onclick="textareaClick();" value="Add To Cart" type="submit"/>
    </div>
 <div class="clearfix"></div>
</div>

{/if}

{/block}

