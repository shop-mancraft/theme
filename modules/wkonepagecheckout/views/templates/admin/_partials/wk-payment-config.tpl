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
<div class="row">
    <div class="col-sm-12 panel">
        <div class="panel-heading">
        <i class="icon-money"></i> {l s='Payment' mod='wkonepagecheckout'}
        </div>
        <div class="panel-body">
            <form action="{$currentIndex}" class="defaultForm form-horizontal" method="post"
                enctype="multipart/form-data">
                <div class="form-wrapper">
                    <div class="form-group">
                        <label class="control-label col-lg-3">
                            {l s='Display payment logo' mod='wkonepagecheckout'}
                        </label>
                        <div class="col-lg-9 ">
                            <span class="switch prestashop-switch fixed-width-lg">
                                <input type="radio" name="wk_checkout_payment_logo" id="wk_checkout_payment_logo_on"
                                    value="1"
                                    {if isset($smarty.post.wk_checkout_payment_logo) && $smarty.post.wk_checkout_payment_logo == 1}checked="checked"
                                    {else if isset($configValues) && $configValues.WK_CHECKOUT_PAYMENT_LOGO == 1}checked="checked"
                                    {else if !isset($smarty.post.wk_checkout_payment_logo)}checked="checked" 
                                    {/if}>
                                <label for="wk_checkout_payment_logo_on">{l s='Yes' mod='wkonepagecheckout'}</label>
                                {if isset($configValues)}
                                    <input type="radio" name="wk_checkout_payment_logo" id="wk_checkout_payment_logo_off"
                                        value="0" {if $configValues.WK_CHECKOUT_PAYMENT_LOGO == '0'}checked="checked"
                                        {else if isset($smarty.post.wk_checkout_payment_logo) && $smarty.post.wk_checkout_payment_logo == '0'}checked="checked"
                                        {/if}>
                                {else}
                                    <input type="radio" name="wk_checkout_payment_logo" id="wk_checkout_payment_logo_off"
                                        value="0"
                                        {if isset($smarty.post.wk_checkout_payment_logo) && $smarty.post.wk_checkout_payment_logo == '0'}checked="checked"
                                        {/if}>
                                {/if}
                                <label for="wk_checkout_payment_logo_off">{l s='No' mod='wkonepagecheckout'}</label>
                                <a class="slide-button btn"></a>
                            </span>
                            <div class="help-block">
                                {l s='Display payment logo along with payment name' mod='wkonepagecheckout'}</div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-3">
                            {l s='Set default payment method' mod='wkonepagecheckout'}
                        </label>
                        <div class="col-lg-4">
                            <select name="wk_checkout_default_payment" id="wk_checkout_default_payment"
                                class="form-control">
                                <option value="0">--</option>
                                {if isset($payment_method) && $payment_method}
                                    {foreach $payment_method as $payment}
                                        <option
                                            {if $configValues.WK_CHECKOUT_DEFAULT_PAYMENT == $payment.name}selected="selected"
                                            {/if}value="{$payment.name}">{$payment.displayName}</option>
                                    {/foreach}
                                {/if}
                            </select>
                            <div class="help-block">
                                {l s='On checkout page, it will display as selected payment method by default' mod='wkonepagecheckout'}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <button type="submit" name="submitPayment" class="btn btn-default pull-right">
                        <i class="process-icon-save"></i> {l s='Save' mod='wkonepagecheckout'}
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>