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
{assign var="customer_group_reduction" value=Group::getReductionByIdGroup($customer.id_default_group)}
{foreach from=$all_products item=product name=product}
    <tr>
    <td class="all" ><a href="{$product.link|escape:'htmlall':'UTF-8'}"> <img src="{$product.cover_image_url|escape:'htmlall':'UTF-8'}" data-default-image="{$product.cover_image_url|escape:'htmlall':'UTF-8'}"></a> </td>
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
            {if isset($product.quantity)}
                {$product.quantity}
            {/if}
        </td>
        <td class="min-tablet-p">
            <div class="price">

            {assign var="result" value=0}
            {if Group::getPriceDisplayMethod($customer.id_default_group)}

                                     {math assign="result" result=$result equation='x+x*y/100' x=$product['price_tax_exc'] y=$customer_group_reduction}
                                    <span class="line-through text-red-600 mr-3">{Tools::displayPrice($product['price_tax_exc']+$product['price_tax_exc']*$customer_group_reduction/100)}</span>
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
            <button class="align-baseline border border-solid border-main rounded-[4px] bg-main py-3 hover:bg-black transition btn btn-{$btn_clr|escape:'htmlall':'UTF-8'}" onclick="fmmAddCart({$product.id_product|escape:'htmlall':'UTF-8'}, {$group_count|escape:'htmlall':'UTF-8'});" >{l s='Add To Cart' mod='quickproducttable'}</button>

            <span class="custom-checkbox ml-5">
                <input type="checkbox"  id="{$product.id_product|escape:'htmlall':'UTF-8'}_{$group_count|escape:'htmlall':'UTF-8'}" name="fmm_check" class="fmm_check top-0 z-10" value="{$product.id_product|escape:'htmlall':'UTF-8'}">
                <span><i class="material-icons rtl-no-flip checkbox-checked"></i></span>
            </span>
        </td>
    </tr>
    {/foreach}
