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
            <i class="icon-book"></i> {l s='Address' mod='wkonepagecheckout'}
        </div>
        <div class="panel-body">
            <form action="{$currentIndex}" class="defaultForm form-horizontal" method="post"
                enctype="multipart/form-data">
                <div class="form-wrapper">
                    <div class="form-group">
                        <label class="control-label col-lg-5 wk-rm-padding">
                            <span title="" data-html="true" data-toggle="tooltip" class="label-tooltip"
                                data-original-title="{l s='If yes then the invoice address will be same as delivery address' mod='wkonepagecheckout'}">{l s='By default delivery address as invoice address' mod='wkonepagecheckout'}</span>
                        </label>
                        <div class="col-lg-6">
                            <span class="switch prestashop-switch fixed-width-lg">
                                <input type="radio" name="wk_checkout_delivery_as_invoice"
                                    id="wk_checkout_delivery_as_invoice_on" value="1"
                                    {if isset($smarty.post.wk_checkout_delivery_as_invoice) && $smarty.post.wk_checkout_delivery_as_invoice == 1}checked="checked"
                                    {else if isset($configValues) && $configValues.WK_CHECKOUT_DELIVERY_AS_INVOICE == 1}checked="checked"
                                    {else if !isset($smarty.post.wk_checkout_delivery_as_invoice)}checked="checked"
                                    {/if}>
                                <label
                                    for="wk_checkout_delivery_as_invoice_on">{l s='Yes' mod='wkonepagecheckout'}</label>
                                {if isset($configValues)}
                                    <input type="radio" name="wk_checkout_delivery_as_invoice"
                                        id="wk_checkout_delivery_as_invoice_off" value="0"
                                        {if $configValues.WK_CHECKOUT_DELIVERY_AS_INVOICE == '0'}checked="checked"
                                        {else if isset($smarty.post.wk_checkout_delivery_as_invoice) && $smarty.post.wk_checkout_delivery_as_invoice == '0'}checked="checked"
                                        {/if}>
                                {else}
                                    <input type="radio" name="wk_checkout_delivery_as_invoice"
                                        id="wk_checkout_delivery_as_invoice_off" value="0"
                                        {if isset($smarty.post.wk_checkout_delivery_as_invoice) && $smarty.post.wk_checkout_delivery_as_invoice == '0'}checked="checked"
                                        {/if}>
                                {/if}
                                <label
                                    for="wk_checkout_delivery_as_invoice_off">{l s='No' mod='wkonepagecheckout'}</label>
                                <a class="slide-button btn"></a>
                            </span>
                            <div class="help-block">
                                {l s='Use delivery address as invoice address' mod='wkonepagecheckout'}</div>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <button type="submit" name="submitDeliveryAddress" class="btn btn-default pull-right">
                        <i class="process-icon-save"></i> {l s='Save' mod='wkonepagecheckout'}
                    </button>
                </div>
            </form>
        </div>
        <hr />
        <ul>
            <li>
                {l s='To manage country wise address field, please click on the below link to configure address field:' mod='wkonepagecheckout'}<br>
                <a href="{$countryLink}" target="_blank">
                    {l s='Localization -> Countries -> Edit country' mod='wkonepagecheckout'}
                </a>
            </li>
            <li style="margin-top:20px;">
                {l s='You can set required address fields using below link:' mod='wkonepagecheckout'}<br>
                <a href="{$addressReqLink}" target="_blank">
                    {l s='Customers -> Addresses -> Set required fields for this section' mod='wkonepagecheckout'}
                </a>
            </li>
        </ul>
    </div>
</div>