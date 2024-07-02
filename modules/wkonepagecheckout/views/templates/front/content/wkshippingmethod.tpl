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
*}<div class="wk-shipping-carriers">
    <h4 class="w-max mx-auto font-normal mb-5 tablet:text-2xl text-main-dark text-xl font-main">{l s='Shipping Method' mod='wkonepagecheckout'}</h4>
    <div class="wkerrorcolor wkhide wk-left w-full" id="wkshipping-error" style="margin-left:25px;"></div>
    <div id="hook-display-before-carrier">
        {hook h='displayBeforeCarrier'}
    </div>
        {if isset($delivery_options) && $delivery_options}
            {foreach from=$delivery_options item=carrier key=carrier_id}
                <div class="row">
                    <div class="wk-shipping-list p-2 border-2 border-solid border-[#64635D] rounded-md">
                        <div class="wk-shipping wkpadding">
                            <span>
                                <input {if $delivery_option == $carrier_id} checked{/if} type="radio"
                                    name="delivery_option[{$id_address}]" id="delivery_option_{$carrier.id}"
                                    class="wk_selected_shipping relative after:absolute after:left-[2px] after:top-[2.5px] after:content-[''] after:h-[8px]  after:transition after:w-[8px] appearance-none after:rounded-full rounded-full border-2 border-[#64635D] border-solid hover:after:bg-main checked:after:!bg-main checked:bg-white checked:border-main checked:focus:bg-white checked:focus:border-mainchecked:focus:ring-transparent checked:focus:shadow-none checked:hover:bg-white checked:hover:border-main checked:ring-0 checked:ring-transparent cursor-pointer focus:ring-0 focus:ring-offset-0 focus:ring-transparent h-4 outline-none ring-transparent transition transition-all w-4" wk-opc-id-carrier="{$carrier.id}"
                                    value="{$carrier.id},">
                                <span></span>
                            </span>
                        </div>
                        <label
                            for="delivery_option_{$carrier.id}"
                            class="cursor-pointer col-md-11 w-full wk-selected-shipping-{$carrier.id} {if $delivery_option == $carrier_id} wkSelectedBorder{/if}">
                            <div class="row flex items-center min-h-[55px] text-base">
                                {if Configuration::get('WK_CHECKOUT_CARRIER_LOGO')}
                                    <div class="col-md-3 col-xs-12 col-sm-3">
                                        {if isset($carrier.logo) && $carrier.logo}
                                            <img class="wk-custom-shipping-icon" width="50" src="{$carrier.logo}">
                                        {else}
                                            <img class="wk-custom-shipping-icon" width="50"
                                                src="{$wk_opc_modules_dir}img/carrier-default.jpg">
                                        {/if}
                                    </div>
                                {/if}
                                <div class="col-md-6 col-xs-12 col-sm-6 font-body text-main-dark">
                                    <span class="carrier-name">{$carrier.name}</span>
                                    <br>
                                    {if Configuration::get('WK_CHECKOUT_CARRIER_DESC')}
                                        {if isset($carrier.delay)}<span class="carrier-delay">{$carrier.delay}</span>{/if}
                                    {/if}
                                </div>
                                <div class="col-md-3 col-xs-12 col-sm-3 font-body text-main-dark">
                                    <span class="carrier-price">{$carrier.price}</span>
                                </div>
                            </div>
                        </label>
                    </div>
                </div>
                <div class="row carrier-extra-content" {if $delivery_option != $carrier_id} style="display:none;" {/if}>
                    {$carrier.extraContent nofilter}
                </div>
            {/foreach}
            <div class="order-options">
                {if $display_order_comment}
                    <div id="delivery">
                        <p for="delivery_message">
                            {l s='If you would like to add a comment about your order, please write it in the field below.' mod='wkonepagecheckout'}
                        </p>
                        <textarea rows="2" cols="120" id="delivery_message" name="delivery_message" maxlength="1600">{$delivery_message}</textarea>
                    </div>
                {/if}
            </div>
        {else}
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="alert alert-danger">
                    {l s='Unfortunately, there are no carriers available for your delivery address.' mod='wkonepagecheckout'}
                </div>
            </div>
        {/if}
    <div id="hook-display-after-carrier">
        {hook h='displayAfterCarrier'}
    </div>
    <div id="wkshipping-method"></div>
</div>
<div class="wkpayment-checkout"></div>