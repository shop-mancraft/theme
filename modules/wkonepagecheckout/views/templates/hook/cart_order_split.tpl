{**
* NOTICE OF LICENSE
*
* All rights reserved,
* Please go through LICENSE.txt file inside our module
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade this module to newer
* versions in the future. If you wish to customize this module for your
* needs please refer to CustomizationPolicy.txt file inside our module for more information.
*
*  @author    Webkul IN
*  @copyright since 2010 Webkul
*  @license   LICENSE.txt
*}
<div>
    <h4 class="border-0 border-b-[3px] border-main border-solid font-normal inline-block mb-5 pb-2 rounded-b-sm tablet:text-2xl text-main-dark text-xl">{l s='Shipping Method' mod='wkonepagecheckout'}</h4>
    <div class="wkerrorcolor wkhide wk-left" id="wkshipping-error" style="margin-left:25px;"></div>
    <div id="hook-display-before-carrier">
        {hook h='displayBeforeCarrier'}
    </div>
</div>
{if $wk_is_logged == 1}
    <div class="delivery-options byHook mod-mpcartordersplit">
        {assign var="default_delivery_option" value=(","|explode:$delivery_option[$id_address])}
        {foreach $option_list as $key => $option}
            {foreach from=$option.carrier_list key=id_seller item=sellerDtl}
                <div class="row wk_product_carriers_wrapper">
                    <div class="col-xs-12 col-sm-12 wk_carrier_primary_block">
                        <p class="wk_shop_link">{l s='STORE NAME : ' mod='wkonepagecheckout'}<a href="{if isset($sellerDtl.seller_detail)}{$sellerDtl.seller_detail.shopcollection}{else}{$urls.base_url}{/if}">
                            {if isset($sellerDtl.seller_detail)}
                                {$sellerDtl.seller_detail.shop_name}
                            {else}
                                {$PS_SHOP_NAME}
                            {/if}
                        </a></p>
                    </div>
                    <div class="col-xs-12 col-sm-12 wk_carrier_secondary_block">
                        <div class="row sub_prodCarrier_wrapper">
                            <div class="col-xs-12 col-sm-12 productBlock">
                                {foreach from=$sellerDtl.product_carrier_list key=pid_carrier item=carrier name=shopcarrier}
                                    {foreach from=$carrier.product_list key=k item=product name=shopProd}
                                        <div class="row wk_product_carriers_cont {if $smarty.foreach.shopcarrier.last && $smarty.foreach.shopProd.last}shopLastProd{/if}">
                                            <div class="row wk_product_wrapper_block">
                                                <div class="col-md-4">
                                                <img src="{$product.product_img}" class="img-responsive img-thumbnail">
                                                </div>
                                                <div class="col-md-8">
                                                    <p class="product_name">{$product.name}</p>
                                                    {if isset($product.attributes)}
                                                        <p class="product_attr">{$product.attributes}</p>
                                                    {/if}
                                                </div>
                                            </div>
                                            {foreach from=$product.carrier_list key=id_carr_k item=id_carrier}
                                                <div class="delivery-option {if ($id_carrier@index % 2)}alternate_{/if}item">
                                                    <div>
                                                        <table class="resume table table-bordered">
                                                            <tr>
                                                                <td class="delivery_option_radio">
                                                                    <input type="radio"
                                                                    id="delivery_option_{$id_carrier}_{$product.id_product}_{$product.id_product_attribute}"
                                                                    data-delivery-option-list-k="delivery_option[{$id_address|intval}]"
                                                                    name="delivery_option[{$product.id_product|intval}{$product.id_product_attribute|intval}]"
                                                                    data-id-product-attr="{$product.id_product_attribute}"
                                                                    data-id-product="{$product.id_product}"
                                                                    data-id-carrier="{$id_carrier}"
                                                                    class="delivery_option_radio delivery_option_{$id_seller}_{$id_carrier} delivery_option_{$id_seller} wk_selected_shipping"
                                                                    data-id_address="{$id_address}"
                                                                    data-key="{$delivery_option[$id_address]}"
                                                                    {if in_array($id_carrier, $default_delivery_option) && isset($selected_delivery_option[$id_carrier][$product.id_product])&& in_array($product.id_product_attribute, $selected_delivery_option[$id_carrier][$product.id_product])}checked="checked"{/if}>
                                                                </td>
                                                                <td class="delivery_option_logo">
                                                                    {if $product.prod_carrier_instance[$id_carrier]->logo}
                                                                        <img class="order_carrier_logo" src="{$product.prod_carrier_instance[$id_carrier]->logo}" alt="{$product.prod_carrier_instance[$id_carrier]->name}"/>
                                                                    {/if}
                                                                </td>
                                                                <td>
                                                                    <strong>{$product.prod_carrier_instance[$id_carrier]->name}</strong>
                                                                    {if isset($product.prod_carrier_instance[$id_carrier]->delay[$language.id])}
                                                                        <br />
                                                                        {l s='Delivery time:' mod='wkonepagecheckout'}&nbsp;{$product.prod_carrier_instance[$id_carrier]->delay[$language.id]}
                                                                    {/if}
                                                                    {if count($product.carrier_list) > 1}
                                                                        <br />
                                                                        {if $product.prod_carrier_dtl.best_grade == $product.prod_carrier_instance[$id_carrier]->grade}
                                                                            {if $product.prod_carrier_dtl.best_price == $product.prod_carrier_dtl[$id_carrier].price_with_tax}
                                                                                <span class="best_grade best_grade_price best_grade_speed">{l s='The best price and speed' mod='wkonepagecheckout'}</span>
                                                                            {else}
                                                                                <span class="best_grade best_grade_speed">{l s='The fastest' mod='wkonepagecheckout'}</span>
                                                                            {/if}
                                                                        {elseif $product.prod_carrier_dtl.best_price == $product.prod_carrier_dtl[$id_carrier].price_with_tax}
                                                                            <span class="best_grade best_grade_price">{l s='The best price' mod='wkonepagecheckout'}</span>
                                                                        {/if}
                                                                    {/if}
                                                                </td>
                                                                <td class="delivery_option_price">
                                                                    <div class="delivery_option_price">
                                                                        {if $product.prod_carrier_dtl[$id_carrier].price_with_tax && !$product.prod_carrier_dtl[$id_carrier].is_free && (!isset($free_shipping) || (isset($free_shipping) && !$free_shipping))}
                                                                            {if $use_taxes == 1}
                                                                                {if $priceDisplay == 1}
                                                                                    {$product.prod_carrier_dtl[$id_carrier].price_without_tax}
                                                                                    {*{convertPrice price=$product.prod_carrier_dtl[$id_carrier].price_without_tax}*}{if $display_tax_label} {l s='(tax excl.)' mod='wkonepagecheckout'}{/if}
                                                                                {else}
                                                                                    {$product.prod_carrier_dtl[$id_carrier].price_with_tax}
                                                                                    {*{convertPrice price=$product.prod_carrier_dtl[$id_carrier].price_with_tax}*}{if $display_tax_label} {l s='(tax incl.)' mod='wkonepagecheckout'}{/if}
                                                                                {/if}
                                                                            {else}
                                                                                {$product.prod_carrier_dtl[$id_carrier].price_without_tax}
                                                                                {*{convertPrice price=$product.prod_carrier_dtl[$id_carrier].price_without_tax}*}
                                                                            {/if}
                                                                        {else}
                                                                            {l s='Free' mod='wkonepagecheckout'}
                                                                        {/if}
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                            {/foreach}
                                        </div>
                                    {/foreach}
                                {/foreach}
                            </div>
                            <div class="col-xs-12 col-sm-12 carrierBlock">
                                {if $sellerDtl.commonCarrier|@count}
                                    {if (($sellerDtl.commonCarrier|@count) == 1) && !($sellerDtl.commonCarrier|@reset)}
                                        <div class="col-sm-12">
                                            <div class="alert alert-danger">
                                                <strong>{l s='Error!' mod='wkonepagecheckout'}</strong> {l s='No carrier is available for this product, please remove this product from cart' mod='wkonepagecheckout'}
                                            </div>
                                        </div>
                                    {else}
                                        <p>
                                            {l s='SELECT SHIPPING' mod='wkonepagecheckout'}
                                        </p>
                                        <div class="dropdown wk_dropdown_cont">
                                            <button class="btn btn-default dropdown-toggle wk_dropdown_btn" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                {foreach from=$sellerDtl.commonCarrierDetail key=id_carrier item=carrierDtl}
                                                    {if in_array($id_carrier, $default_delivery_option) && in_array($id_carrier, $sellerDtl.selectedCarriers)}
                                                        {if Configuration::get('WK_CHECKOUT_CARRIER_LOGO')}
                                                            <div class="wk_carrier_com_div wk_carrier_img_div">
                                                                {if $carrierDtl.logo}
                                                                    <img class="order_carrier_logo" width="45" src="{$carrierDtl.logo}" alt="{$carrierDtl.name}"/>
                                                                {else}
                                                                    <img class="order_carrier_logo" width="45" src="{$wk_opc_modules_dir}img/carrier-default.jpg">
                                                                {/if}
                                                            </div>
                                                        {/if}

                                                        <div class="wk_carrier_com_div wk_carrier_dtl_div">
                                                            <strong>{$carrierDtl.name}</strong>
                                                            {if Configuration::get('WK_CHECKOUT_CARRIER_DESC')}
                                                                {if isset($carrierDtl.delay)}
                                                                    <br />
                                                                    {* {l s='Delivery time:' mod='wkonepagecheckout'}&nbsp; *}
                                                                    <span class="wk_carrier_delay">{$carrierDtl.delay}</span>
                                                                {/if}
                                                                {if count($sellerDtl.commonCarrierDetail) > 1}
                                                                    <br />
                                                                    {if $carrierDtl.best_grade}
                                                                        {if $carrierDtl.best_price}
                                                                            <span class="best_grade best_grade_price best_grade_speed">{l s='The best price and speed' mod='wkonepagecheckout'}</span>
                                                                        {else}
                                                                            <span class="best_grade best_grade_speed">{l s='The fastest' mod='wkonepagecheckout'}</span>
                                                                        {/if}
                                                                    {elseif $carrierDtl.best_price}
                                                                        <span class="best_grade best_grade_price">{l s='The best price' mod='wkonepagecheckout'}</span>
                                                                    {/if}
                                                                {/if}
                                                            {/if}
                                                        </div>
                                                        <div class="wk_carrier_com_div wk_carrier_price_div">
                                                            {if $carrierDtl.price_with_tax && !$carrierDtl.is_free && (!isset($free_shipping) || (isset($free_shipping) && !$free_shipping))}
                                                                {if $use_taxes == 1}
                                                                    {if $priceDisplay == 1}
                                                                        {$carrierDtl.displayPriceWithoutTax}
                                                                    {else}
                                                                        {$carrierDtl.displayPriceWithTax}
                                                                    {/if}
                                                                {else}
                                                                    {$carrierDtl.displayPriceWithoutTax}
                                                                    {*{convertPrice price=$carrierDtl.price_without_tax}*}
                                                                {/if}
                                                            {else}
                                                                {l s='Free' mod='wkonepagecheckout'}
                                                            {/if}
                                                        </div>
                                                    {/if}
                                                {/foreach}
                                            </button>
                                            <ul class="dropdown-menu wk_carrier_dp_ul">
                                                {foreach from=$sellerDtl.commonCarrierDetail key=id_carrier item=carrierDtl}
                                                    <li>
                                                        <div class="table-responsive">
                                                            <table class="resume table">
                                                                <tr class="carrier_data_tr" data-id-carrier="{$id_carrier}" data-id-seller="{$id_seller}">
                                                                    {if Configuration::get('WK_CHECKOUT_CARRIER_LOGO')}
                                                                        <td class="col-xs-3 col-sm-3 delivery_option_logo">
                                                                        {if $carrierDtl.logo}
                                                                            <img class="order_carrier_logo" width="45" src="{$carrierDtl.logo}" alt="{$carrierDtl.name}"/>
                                                                        {else}
                                                                            <img class="order_carrier_logo" width="45" src="{$wk_opc_modules_dir}img/carrier-default.jpg">
                                                                        {/if}
                                                                        </td>
                                                                        <td class="col-xs-6 col-sm-6 delivery_option_dtl">
                                                                    {else}
                                                                        <td class="col-xs-9 col-sm-9 delivery_option_dtl">
                                                                    {/if}
                                                                        <strong>{$carrierDtl.name}</strong>
                                                                        {if Configuration::get('WK_CHECKOUT_CARRIER_DESC')}
                                                                            {if isset($carrierDtl.delay)}
                                                                                <br />
                                                                                <span class="wk_carrier_delay">{$carrierDtl.delay}</span>
                                                                            {/if}
                                                                            {if count($sellerDtl.commonCarrierDetail) > 1}
                                                                                <br />
                                                                                {if $carrierDtl.best_grade}
                                                                                    {if $carrierDtl.best_price}
                                                                                        <span class="best_grade best_grade_price best_grade_speed">{l s='The best price and speed' mod='wkonepagecheckout'}</span>
                                                                                    {else}
                                                                                        <span class="best_grade best_grade_speed">{l s='The fastest' mod='wkonepagecheckout'}</span>
                                                                                    {/if}
                                                                                {elseif $carrierDtl.best_price}
                                                                                    <span class="best_grade best_grade_price">{l s='The best price' mod='wkonepagecheckout'}</span>
                                                                                {/if}
                                                                            {/if}
                                                                        {/if}
                                                                    </td>
                                                                    <td class="col-xs-3 col-sm-3 delivery_option_price">
                                                                        <div class="delivery_option_price">
                                                                            {if $carrierDtl.price_with_tax && !$carrierDtl.is_free && (!isset($free_shipping) || (isset($free_shipping) && !$free_shipping))}
                                                                                {if $use_taxes == 1}
                                                                                    {if $priceDisplay == 1}
                                                                                        {$carrierDtl.displayPriceWithoutTax}
                                                                                    {else}
                                                                                        {$carrierDtl.displayPriceWithTax}
                                                                                    {/if}
                                                                                {else}
                                                                                    {$carrierDtl.displayPriceWithoutTax}
                                                                                {/if}
                                                                            {else}
                                                                                {l s='Free' mod='wkonepagecheckout'}
                                                                            {/if}
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </li>
                                                {/foreach}
                                            </ul>
                                        </div>
                                    {/if}
                                {else}
                                    {assign var="shippingCostTi" value = $sellerDtl.diffCarrierTotal.price_with_tax}
                                    {assign var="shippingCostTe" value = $sellerDtl.diffCarrierTotal.price_without_tax}
                                    <p>{l s='AVAILABLE SHIPPING' mod='wkonepagecheckout'}</p>
                                    <div class="multiShippingCont">
                                        <div class="multiShippingBlock msInputCont">
                                            <input type="radio" checked="checked">
                                        </div>
                                        <div class="multiShippingBlock msShippingCont">
                                            {foreach from=$sellerDtl.diffCarrierDetail key=id_carrier item=carrierDtl name=diffShopShipping}
                                                <div data-id-carrier="{$id_carrier}" data-id-seller="{$id_seller}" class="msShipping {if !$smarty.foreach.diffShopShipping.last}msShippingBorder{/if}">
                                                    {if !$id_carrier}
                                                        <div class="col-sm-12">
                                                            <div class="alert alert-danger">
                                                                <strong>{l s='Error!' mod='wkonepagecheckout'}</strong> {l s='No carrier is available for this product, please remove this product from cart' mod='wkonepagecheckout'}
                                                            </div>
                                                        </div>
                                                    {else}
                                                        <div class="table-responsive">
                                                            <table class="resume table">
                                                                <tr>
                                                                    {if Configuration::get('WK_CHECKOUT_CARRIER_LOGO')}
                                                                        <td class="col-xs-3 col-sm-3 delivery_option_logo">
                                                                            {if $carrierDtl.logo}
                                                                                <img class="order_carrier_logo" width="45" src="{$carrierDtl.logo}" alt="{$carrierDtl.name}"/>
                                                                            {else}
                                                                                <img class="order_carrier_logo" width="45" src="{$wk_opc_modules_dir}img/carrier-default.jpg">
                                                                            {/if}
                                                                        </td>
                                                                        <td class="col-xs-9 col-sm-9 delivery_option_dtl">
                                                                    {else}
                                                                        <td class="col-xs-12 col-sm-12 delivery_option_dtl">
                                                                    {/if}
                                                                        <strong>{$carrierDtl.name}</strong>
                                                                        {if Configuration::get('WK_CHECKOUT_CARRIER_DESC')}
                                                                            {if isset($carrierDtl.delay)}
                                                                                <br />
                                                                                {l s='Delivery time:' mod='wkonepagecheckout'}&nbsp;{$carrierDtl.delay}
                                                                            {/if}
                                                                        {/if}
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    {/if}
                                                </div>
                                            {/foreach}
                                        </div>
                                        <div class="multiShippingBlock msPriceCont">
                                            <span>
                                                {if $shippingCostTi && (!isset($free_shipping) || (isset($free_shipping) && !$free_shipping))}
                                                    {if $use_taxes == 1}
                                                        {if $priceDisplay == 1}
                                                            {$sellerDtl.diffCarrierTotal.displayPriceWithoutTax}
                                                        {else}
                                                            {$sellerDtl.diffCarrierTotal.displayPriceWithTax}
                                                        {/if}
                                                    {else}
                                                        {$sellerDtl.diffCarrierTotal.displayPriceWithoutTax}
                                                    {/if}
                                                {else}
                                                    {l s='Free' mod='wkonepagecheckout'}
                                                {/if}
                                            </span>
                                        </div>
                                    </div>
                                {/if}
                                <div class="wk-shipping-cost">
                                    {if $use_taxes == 1}
                                        <em>
                                        {if $priceDisplay == 1}
                                            {if $display_tax_label}
                                                {l s='(Shipping cost tax excl.)' mod='wkonepagecheckout'}
                                            {/if}
                                        {else}
                                            {if $display_tax_label}
                                                {l s='(Shipping cost tax incl.)' mod='wkonepagecheckout'}
                                            {/if}
                                        {/if}
                                        </em>
                                    {else}
                                        <em>{l s='(Shipping cost tax excl.)' mod='wkonepagecheckout'}</em>
                                    {/if}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            {/foreach}
        {/foreach}
    </div>
{else}
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="alert alert-danger">
            {l s='First you need to fill the shipping address.' mod='wkonepagecheckout'}
        </div>
    </div>
{/if}

<div class="col-md-12 col-sm-12 col-xs-12">
    <div id="hook-display-after-carrier">
        {hook h='displayAfterCarrier'}
    </div>
    <div id="delivery">
        <p for="delivery_message">{l s='If you would like to add a comment about your order, please write it in the field below.' mod='wkonepagecheckout'}</p>
        <textarea rows="3" cols="52" id="delivery_message" name="delivery_message">{$delivery_message}</textarea>
    </div>
</div>
