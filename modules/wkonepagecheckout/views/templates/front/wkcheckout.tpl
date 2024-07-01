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

{extends file='checkout/checkout.tpl'}
{block name='content'}
    <section class="main" id="wk-one-page-checkout">
        <section class="desktop-presta:px-24 tablet-medium:px-7 font-body">
            <div class="pt-10 dekstop-presta:pt-60px max-w-[850px] mx-auto">
                {block name='wk_order_summary'}
                    {include file="module:wkonepagecheckout/views/templates/front/content/wkordersummary.tpl"}
                {/block}

                {block name='wk-customer-info'}
                    {include file="module:wkonepagecheckout/views/templates/front/content/wk_customer_info.tpl"}
                {/block}

                {if $wk_is_logged == 1 && (int)$id_address > 0}
                    <div class="mb-5 p-5 bg-white rounded-[5px] clearfix">
                        {block name='wk_order_shipping'}
                            <div class="col-md-12 col-sm-12 col-xs-12 mb-10" id="wk_shipping_section">
                                {if isset($cart_order_split_tpl) && $cart_order_split_tpl}
                                    {include file="module:wkonepagecheckout/views/templates/hook/cart_order_split.tpl"}
                                {else}
                                    {include file="module:wkonepagecheckout/views/templates/front/content/wkshippingmethod.tpl"}
                                {/if}
                            </div>
                        {/block}

                        {block name='wk_order_payment'}
                            <div class="col-md-12 col-sm-12 col-xs-12" id="wk_payment_section">
                                {include file="module:wkonepagecheckout/views/templates/front/content/wkpaymentmethod.tpl"}
                            </div>
                        {/block}
                        {if $display_reassurance}
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                {hook h='displayReassurance'}
                            </div>
                        {/if}

                        {block name='wk_payment_condition'}
                            {include file="module:wkonepagecheckout/views/templates/front/content/wkcondition.tpl"}
                        {/block}
                    </div>
                {/if}
            </div>
        </section>
        {if Configuration::get('WK_CHECKOUT_CART_ALSO_BOUGHT')}
            {hook h="displayWhoBoughtAlsoBought"}
        {/if}
    </section>
{/block}
