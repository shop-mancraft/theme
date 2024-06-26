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

<script src="{$jQuery_path|escape:'htmlall':'UTF-8'}"></script>
<script src="{$inview|escape:'htmlall':'UTF-8'}"></script>
<input type="hidden" id="noofrow" name="noofrow" value="{$noofrow|escape:'htmlall':'UTF-8'}">
<input type="hidden" id="page_no" name="page_no" value="2">
<input type="hidden" name="product_type" id="product_type" value="{$product_type|escape:'htmlall':'UTF-8'}">

{if $in_ary == true}
<h1 class="text-white text-xl mb-5">{$head_name_{$id_lang}|escape:'htmlall':'UTF-8'}</h1>
<div class="bg-gray-normal  mb-10 rounded-lg col-lg-10">
    <div class="col-lg-1 col-xs-12 top_buttons">
        <p class=" py-2 ">{l s='Filters:' d='Modules.Quickproducttable.Fmmtable'}</p>

    </div>
    {if $new_enable == 1}
    <div class="col-lg-2 col-xs-12 top_buttons" >
        <a class="border-0 rounded-[4px] bg-black py-3 hover:bg-main transition btn btn-{$btn_clr|escape:'htmlall':'UTF-8'}" href="{$base_url|escape:'htmlall':'UTF-8'}{$route_name|escape:'htmlall':'UTF-8'}?product_type=new">{l s='New Products' d='Modules.Quickproducttable.Fmmtable'}</a>
    </div>
    {/if}
    {if $best_enable == 1}
    <div class="col-lg-2 col-xs-12 top_buttons" >
        <a class="border-0 rounded-[4px] bg-black py-3 hover:bg-main transition btn btn-{$btn_clr|escape:'htmlall':'UTF-8'}" href="{$base_url|escape:'htmlall':'UTF-8'}{$route_name|escape:'htmlall':'UTF-8'}?product_type=best">{l s='Best Sales' d='Modules.Quickproducttable.Fmmtable'}</a>
    </div>
    {/if}
    {if $all_enable == 1}
    <div class="col-lg-2 col-xs-12 top_buttons">
        <a class="border-0 rounded-[4px] bg-black py-3 hover:bg-main transition btn btn-{$btn_clr|escape:'htmlall':'UTF-8'}" href="{$base_url|escape:'htmlall':'UTF-8'}{$route_name|escape:'htmlall':'UTF-8'}?product_type=all">{l s='All Products' d='Modules.Quickproducttable.Fmmtable'}</a>
    </div>
    {/if}
    {if $sale_enable == 1}
    <div class="col-lg-2 col-xs-12 top_buttons">
        <a class="border-0 rounded-[4px] bg-black py-3 hover:bg-main transition btn btn-{$btn_clr|escape:'htmlall':'UTF-8'}" href="{$base_url|escape:'htmlall':'UTF-8'}{$route_name|escape:'htmlall':'UTF-8'}?product_type=sale">{l s='Prices Drop' d='Modules.Quickproducttable.Fmmtable'}</a>
    </div>
    {/if}

    {if $advance_enable == 1}
    <div class="col-lg-3 col-xs-12 top_buttons">
        <a class="border-0 rounded-[4px] bg-main py-3 hover:bg-black transition btn btn-{$btn_clr|escape:'htmlall':'UTF-8'}" href="{$base_url|escape:'htmlall':'UTF-8'}{$route_name|escape:'htmlall':'UTF-8'}?product_type=advance">
            <svg class="mr-1 inline-block" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="width: 18px;" class="inline">
		    	<path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z" fill="#fff"></path>
	        </svg>
            {l s='Advance Search' d='Modules.Quickproducttable.Fmmtable'}
        </a>
    </div>
    {/if}
</div>
{if $csv_enable == 1}
<div class="col-lg-2 col-xs-12 top_buttons">
    <a class="border-0 rounded-[4px] bg-main py-3 hover:bg-black transition btn btn-{$btn_clr|escape:'htmlall':'UTF-8'}" href="{$base_url|escape:'htmlall':'UTF-8'}{$route_name|escape:'htmlall':'UTF-8'}?product_type=csv">
    {l s='Add In Bulk' d='Modules.Quickproducttable.Fmmtable'}</a>
</div>
{/if}


<input type="hidden" name="ajax_url" id="ajax_url" value="{$ajax_url|escape:'htmlall':'UTF-8'}">
<table id="fmm_table" class="display nowrap">
        <thead class="text-base tablet:text-xl text-white font-normal">
        <tr>
            <th class="all" >{l s='Image' d='Modules.Quickproducttable.Fmmtable'}</th>
            <th class="all" >{l s='Name' d='Modules.Quickproducttable.Fmmtable'}</th>
            <th class="desktop"></th>
            <th class="desktop	">{l s='Stock' d='Modules.Quickproducttable.Fmmtable'}</th>
            <th class="min-tablet-p 	">{l s='Price' d='Modules.Quickproducttable.Fmmtable'}</th>
            <th class="desktop	">{l s='Discounts' d='Modules.Quickproducttable.Fmmtable'}</th>
            <th class="desktop	">{l s='Quantity' d='Modules.Quickproducttable.Fmmtable'}</th>
            <th class="desktop	select-all-chk"><span class="col-title">{l s='Action ' d='Modules.Quickproducttable.Fmmtable'}</span>
                <span class="flex items-center justify-between w-full">
                    <p style="padding-left: 22px;">{l s="Select all" d='Modules.Quickproducttable.Fmmtable'}</p>
                    <span class="custom-checkbox mr-[3px]">
                        <input class="" type="checkbox" data-toggle="toggle" id="chkal3" data-size="xs">
                        <span><i class="material-icons rtl-no-flip checkbox-checked"></i></span>
                    </span>
                </span>
            </th>
        </tr>



        </thead>
        <tbody id="fmm_table_body">
        {assign var="customer_group_reduction" value=Group::getReductionByIdGroup($customer.id_default_group)}
          {foreach from=$all_products item=product name=product}
            <tr>
                <td class="all" ><a href="{$product.link|escape:'htmlall':'UTF-8'}"> <img src="{$product.cover_image_url|escape:'htmlall':'UTF-8'}" data-default-image="{$product.cover_image_url|escape:'htmlall':'UTF-8'}"></a> </td>
                <td class="all" >
                    <a href="{$product.link|escape:'htmlall':'UTF-8'}">{$product.name|escape:'htmlall':'UTF-8'}</a>
                    <div class="options flex flex-wrap">
                    </div>
                </td>
                <td class="desktop">
                    <div class="flex flex-wrap">
                    {assign var="group_count" value=0}
                    {foreach from=$product.options item=options name=options}
                        {assign var="group_count" value={$group_count|escape:'htmlall':'UTF-8'}+1}
                        <span class="flex flex-col w-full">

                        <span >{$options.name|escape:'htmlall':'UTF-8'}</span>

                        <select id="select_fmm" onchange="changeAttr({$product.id_product|escape:'htmlall':'UTF-8'}, {$smarty.foreach.options.total})" class="fmm_option_{$product.id_product|escape:'htmlall':'UTF-8'}_{$smarty.foreach.options.iteration}">
                            {foreach from=$options.values item=values name=values}

                                <option value="{$values.id|escape:'htmlall':'UTF-8'}">{$values.value|escape:'htmlall':'UTF-8'}</option>

                            {/foreach}
                        </select>
                    </span>
                    {/foreach}
                    </div>
                </td>
                <td class="desktop		">
                    <span id="stock_{$product.id_product|escape:'htmlall':'UTF-8'}">
                        {if isset($product.quantity)}
                            {$product.quantity}
                        {/if}
                    </span>
                </td>
                <td class="min-tablet-p">
                    <div class="price">


 {assign var="result" value=0}
 {if Group::getPriceDisplayMethod($customer.id_default_group)}

                          {math assign="result" result=$result equation='x+x*y/100' x=$product['price_tax_exc'] y=$customer_group_reduction}
                         <span class="line-through text-red-600 mr-3">{Tools::displayPrice($result)}</span>
                         <span id="price_{$product.id_product|escape:'htmlall':'UTF-8'}">{Tools::displayPrice($product['price_tax_exc'])}</span>

 {else}

                          {math assign="result" result=$result equation='x+x*y/100' x=$product['price'] y=$customer_group_reduction}
                         <span class="line-through text-red-600 mr-3">{Tools::displayPrice($result)}</span>
                         <span id="price_{$product.id_product|escape:'htmlall':'UTF-8'}">{Tools::displayPrice($product['price'])}</span>


 {/if}


                    </div>
                </td>
                <td class="desktop	">

                {math assign="group_reduction" result=$result equation='x*100' x=GroupReduction::getValueForProduct($product.id_product,$customer.id_default_group)}
                -{$group_reduction}%

                </td>
                <td class="desktop	">
                    <div class="">
                        <div class="number" id="number">
                        <span class="minus align-sub p-0 px-1 text-xl tablet:text-2xl text-white hover:text-primary select-none  duration-75">-</span>
                        <input class="qty_id text-xl w-10 text-center text-gray-dark" id="quantity_{$product.id_product|escape:'htmlall':'UTF-8'}" type="text" value="1"/>
                        <span class="plus align-sub p-0 px-1 text-xl tablet:text-2xl text-white hover:text-primary select-none  duration-75">+</span>
                        </div>
                    </div>
                </td>
                <td class="desktop	">
                    <input type="hidden" name="group" id="group_{$product.id_product|escape:'htmlall':'UTF-8'}" value="{$group_count|escape:'htmlall':'UTF-8'}">
                    <button class="align-baseline border border-solid border-main rounded-[4px] bg-main py-3 hover:bg-black transition btn btn-{$btn_clr|escape:'htmlall':'UTF-8'}" onclick="fmmAddCart({$product.id_product|escape:'htmlall':'UTF-8'}, {$group_count|escape:'htmlall':'UTF-8'});" >{l s='Add To Cart' d='Modules.Quickproducttable.Fmmtable'}</button>
                    <span class="custom-checkbox ml-5">
                        <input type="checkbox"  id="{$product.id_product|escape:'htmlall':'UTF-8'}_{$group_count|escape:'htmlall':'UTF-8'}" name="fmm_check" class="fmm_check top-0 z-10" value="{$product.id_product|escape:'htmlall':'UTF-8'}">
                        <span><i class="material-icons rtl-no-flip checkbox-checked"></i></span>
                    </span>

                </td>
            </tr>
            {/foreach}
        </tbody>
        <tfoot class="text-base tablet:text-xl text-white font-normal">
            <tr>
                <th class="all" >{l s='Image' d='Modules.Quickproducttable.Fmmtable'}</th>
                <th class="all" >{l s='Name' d='Modules.Quickproducttable.Fmmtable'}</th>
                <th class="desktop"></th>
                <th class="desktop	">{l s='Stock' d='Modules.Quickproducttable.Fmmtable'}</th>
                <th class="min-tablet-p 	">{l s='Price' d='Modules.Quickproducttable.Fmmtable'}</th>
                <th class="desktop	">{l s='Discounts' d='Modules.Quickproducttable.Fmmtable'}</th>
                <th class="desktop	">{l s='Quantity' d='Modules.Quickproducttable.Fmmtable'}</th>
                <th class="desktop	select-all-chk"><span class="col-title">{l s='Action ' d='Modules.Quickproducttable.Fmmtable'}</span>
                    <span class="flex items-center justify-between w-full">
                        <p style="padding-left: 22px;">{l s="Select all" d='Modules.Quickproducttable.Fmmtable'}</p>
                        <span class="custom-checkbox mr-[3px]">
                            <input class="" type="checkbox" data-toggle="toggle" id="chkal3" data-size="xs">
                            <span><i class="material-icons rtl-no-flip checkbox-checked"></i></span>
                        </span>
                    </span>
                </th>
            </tr>

        </tfoot>
    </table>
    {if $ajax_load}
    <input type="hidden" id="pageno" value="1">
    <span class="flex justify-center invert blend-exclusion">
    <img id="loader" src="{$base_url}modules/quickproducttable/views/img/loading.svg">
    </span>
    {/if}


<div class="col-lg-12 col-xs-12 top_buttons" >
    <a class="border-0 rounded-[4px] bg-main py-3 hover:bg-black transition btn btn-{$btn_clr|escape:'htmlall':'UTF-8'}" href="{$cart_url|escape:'htmlall':'UTF-8'}?action=show">{l s='View Cart' d='Modules.Quickproducttable.Fmmtable'}</a>
    <button class="border-0 rounded-[4px] bg-main py-3 hover:bg-black transition btn btn-{$btn_clr|escape:'htmlall':'UTF-8'}" onclick="fmmAddAllCart();" >{l s='Add Selected To Cart' d='Modules.Quickproducttable.Fmmtable'}</button>
</div>
    {if $ajax_load}
        {literal}
    <script type="text/javascript">

                $('#loader').on('inview', function(event, isInView) {

                    if (isInView) {
                        var lastItem = $('#fmm_table_body tr').length;
                        var ajax_url = $("#ajax_url").val();
                        var noofrow = $("#noofrow").val();
                        var product_type = $("#product_type").val();
                        var old_page = $("#page_no").val();
                        if (!old_page) {
                            old_page = 1;
                        }
                        $.ajax({
                            type: 'POST',
                            url: ajax_url,
                            data: {
                                lastItem: lastItem ,ajax:1,noofrow:noofrow, product_type:product_type, old_page:old_page, action: 'productChangeLength'
                            },
                            dataType: "html",
                            success: function(response){
                                if (response != 2) {
                                    var b = 1;
                                    var new_page = parseInt(old_page, 10) + parseInt(b, 10);
                                    $('#fmm_table').DataTable().rows.add($(response).filter('tr')).draw()
                                    $('#page_no').val(new_page);
                                } else {
                                   $("#loader").hide();
                                }
                            }
                        });
                    }
                });


    </script>
    <style type="text/css">
        .btn-primary {
            font-size: small;
        }
    </style>
    {/literal}
    {/if}
{/if}
{/block}

