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

{foreach from=$all_products item=product name=product}
    <tr>
        <td class="all" ><a href="{$product.link|escape:'htmlall':'UTF-8'}"> <img src="{$product.cover_image_url|escape:'htmlall':'UTF-8'}"></a> </td>
        <td class="all" >
            <a href="{$product.link|escape:'htmlall':'UTF-8'}">{$product.name|escape:'htmlall':'UTF-8'}</a>
            <div class="options flex flex-wrap">
            {assign var="group_count" value=0}
            {foreach from=$product.options item=options name=options}
                <span>
                {$options.name|escape:'htmlall':'UTF-8'}
                {assign var="group_count" value={$group_count|escape:'htmlall':'UTF-8'}+1}
                
                <select id="select_fmm" onchange="changeAttr({$product.id_product|escape:'htmlall':'UTF-8'}, {$group_count|escape:'htmlall':'UTF-8'})" class="fmm_option_{$product.id_product|escape:'htmlall':'UTF-8'}_{$group_count|escape:'htmlall':'UTF-8'}">
                    {foreach from=$options.values item=values name=values}

                        <option value="{$values.id|escape:'htmlall':'UTF-8'}">{$values.value|escape:'htmlall':'UTF-8'}</option>

                    {/foreach}
                </select> 
               </span> 
            {/foreach}
            </div>
        </td>
        <td class="desktop	 options2">
            <div class=" flex flex-wrap">
            {assign var="group_count" value=0}
            {foreach from=$product.options item=options name=options}
                <span class="flex flex-col w-full">

                <span >{$options.name|escape:'htmlall':'UTF-8'}</span>
                {assign var="group_count" value={$group_count|escape:'htmlall':'UTF-8'}+1}
                
                <select id="select_fmm" onchange="changeAttr({$product.id_product|escape:'htmlall':'UTF-8'}, {$group_count|escape:'htmlall':'UTF-8'})" class="fmm_option_{$product.id_product|escape:'htmlall':'UTF-8'}_{$group_count|escape:'htmlall':'UTF-8'}">
                    {foreach from=$options.values item=values name=values}

                        <option value="{$values.id|escape:'htmlall':'UTF-8'}">{$values.value|escape:'htmlall':'UTF-8'}</option>

                    {/foreach}
                </select> 
            </span> 
            {/foreach}
            </div>
        </td>

        <td class="desktop		">
            {if isset($product.quantity)}
                {$product.quantity}
            {/if}
        </td>
        <td class="min-tablet-p">
            <div class="price">
                <span class="line-through text-red-600 mr-3">{$product.default_currency_sign|escape:'htmlall':'UTF-8'}{Product::getPriceStatic($product['id_product'], true, null, 2, null, false, true, 1, true, null, null, null, $nothing, true, false, null)|number_format:2}</span>
                <span id="price_{$product.id_product|escape:'htmlall':'UTF-8'}">{$product.default_currency_sign|escape:'htmlall':'UTF-8'}{$product.price|number_format:2}</span>
            </div>
        </td>
        <td class="desktop	">
            {if isset($product.specific_prices) && !empty($product.specific_prices)}
              <span class="text-red-500"> - {if $product.specific_prices['reduction_type'] == 'amount'}{$product.specific_prices['reduction']|number_format:2} {$product.default_currency_sign|escape:'htmlall':'UTF-8'}{else}{$product.specific_prices['reduction']|number_format:2}%{/if}</span>
            {/if}
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
            <button class="align-baseline border border-solid border-main rounded-[4px] bg-main py-3 hover:bg-black transition btn btn-{$btn_clr|escape:'htmlall':'UTF-8'}" onclick="fmmAddCart({$product.id_product|escape:'htmlall':'UTF-8'}, {$group_count|escape:'htmlall':'UTF-8'});" >{l s='Add To Cart' mod='quickproducttable'}</button>
            
            <span class="custom-checkbox ml-5">
                <input type="checkbox"  id="{$product.id_product|escape:'htmlall':'UTF-8'}_{$group_count|escape:'htmlall':'UTF-8'}" name="fmm_check" class="fmm_check top-0 z-10" value="{$product.id_product|escape:'htmlall':'UTF-8'}">
                <span><i class="material-icons rtl-no-flip checkbox-checked"></i></span>
            </span>
        </td>
    </tr>
    {/foreach}
