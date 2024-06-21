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
            <i class="icon-truck"></i> {l s='Shipping' mod='wkonepagecheckout'}
        </div>
        <div class="panel-body">
            <form action="{$currentIndex}" class="defaultForm form-horizontal" method="post"
                enctype="multipart/form-data">
                <div class="form-wrapper">
                    <div class="form-group">
                        <label class="control-label col-lg-3">
                            {l s='Display carrier logo' mod='wkonepagecheckout'}
                        </label>
                        <div class="col-lg-9 ">
                            <span class="switch prestashop-switch fixed-width-lg">
                                <input type="radio" name="wk_checkout_carrier_logo" id="wk_checkout_carrier_logo_on"
                                    value="1"
                                    {if isset($smarty.post.wk_checkout_carrier_logo) && $smarty.post.wk_checkout_carrier_logo == 1}checked="checked"
                                    {else if isset($configValues) && $configValues.WK_CHECKOUT_CARRIER_LOGO == 1}checked="checked"
                                    {else if !isset($smarty.post.wk_checkout_carrier_logo)}checked="checked" 
                                    {/if}>
                                <label for="wk_checkout_carrier_logo_on">{l s='Yes' mod='wkonepagecheckout'}</label>
                                {if isset($configValues)}
                                    <input type="radio" name="wk_checkout_carrier_logo" id="wk_checkout_carrier_logo_off"
                                        value="0" {if $configValues.WK_CHECKOUT_CARRIER_LOGO == '0'}checked="checked"
                                        {else if isset($smarty.post.wk_checkout_carrier_logo) && $smarty.post.wk_checkout_carrier_logo == '0'}checked="checked"
                                        {/if}>
                                {else}
                                    <input type="radio" name="wk_checkout_carrier_logo" id="wk_checkout_carrier_logo_off"
                                        value="0"
                                        {if isset($smarty.post.wk_checkout_carrier_logo) && $smarty.post.wk_checkout_carrier_logo == '0'}checked="checked"
                                        {/if}>
                                {/if}
                                <label for="wk_checkout_carrier_logo_off">{l s='No' mod='wkonepagecheckout'}</label>
                                <a class="slide-button btn"></a>
                            </span>
                            <div class="help-block">
                                {l s='Display carrier logo along with carrier name' mod='wkonepagecheckout'}</div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-3">
                            {l s='Display carrier description' mod='wkonepagecheckout'}
                        </label>
                        <div class="col-lg-9 ">
                            <span class="switch prestashop-switch fixed-width-lg">
                                <input type="radio" name="wk_checkout_carrier_desc" id="wk_checkout_carrier_desc_on"
                                    value="1"
                                    {if isset($smarty.post.wk_checkout_carrier_desc) && $smarty.post.wk_checkout_carrier_desc == 1}checked="checked"
                                    {else if isset($configValues) && $configValues.WK_CHECKOUT_CARRIER_DESC == 1}checked="checked"
                                    {else if !isset($smarty.post.wk_checkout_carrier_desc)}checked="checked" 
                                    {/if}>
                                <label for="wk_checkout_carrier_desc_on">{l s='Yes' mod='wkonepagecheckout'}</label>
                                {if isset($configValues)}
                                    <input type="radio" name="wk_checkout_carrier_desc" id="wk_checkout_carrier_desc_off"
                                        value="0" {if $configValues.WK_CHECKOUT_CARRIER_DESC == '0'}checked="checked"
                                        {else if isset($smarty.post.wk_checkout_carrier_desc) && $smarty.post.wk_checkout_carrier_desc == '0'}checked="checked"
                                        {/if}>
                                {else}
                                    <input type="radio" name="wk_checkout_carrier_desc" id="wk_checkout_carrier_desc_off"
                                        value="0"
                                        {if isset($smarty.post.wk_checkout_carrier_desc) && $smarty.post.wk_checkout_carrier_desc == '0'}checked="checked"
                                        {/if}>
                                {/if}
                                <label for="wk_checkout_carrier_desc_off">{l s='No' mod='wkonepagecheckout'}</label>
                                <a class="slide-button btn"></a>
                            </span>
                            <div class="help-block">
                                {l s='Display carrier description along with carrier name' mod='wkonepagecheckout'}
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-lg-3">
                            {l s='Display delivery comment box' mod='wkonepagecheckout'}
                        </label>
                        <div class="col-lg-9 ">
                            <span class="switch prestashop-switch fixed-width-lg">
                                <input type="radio" name="wk_checkout_display_order_comment"
                                    id="wk_checkout_display_order_comment_on" value="1"
                                    {if isset($smarty.post.wk_checkout_display_order_comment) && $smarty.post.wk_checkout_display_order_comment == 1}checked="checked"
                                    {else if isset($configValues) && $configValues.WK_CHECKOUT_DISPLAY_ORDER_COMMENT == 1}checked="checked"
                                    {else if !isset($smarty.post.wk_checkout_display_order_comment)}checked="checked"
                                    {/if}>
                                <label
                                    for="wk_checkout_display_order_comment_on">{l s='Yes' mod='wkonepagecheckout'}</label>
                                {if isset($configValues)}
                                    <input type="radio" name="wk_checkout_display_order_comment"
                                        id="wk_checkout_display_order_comment_off" value="0"
                                        {if $configValues.WK_CHECKOUT_DISPLAY_ORDER_COMMENT == '0'}checked="checked"
                                        {else if isset($smarty.post.wk_checkout_display_order_comment) && $smarty.post.wk_checkout_display_order_comment == '0'}checked="checked"
                                        {/if}>
                                {else}
                                    <input type="radio" name="wk_checkout_display_order_comment"
                                        id="wk_checkout_display_order_comment_off" value="0"
                                        {if isset($smarty.post.wk_checkout_display_order_comment) && $smarty.post.wk_checkout_display_order_comment == '0'}checked="checked"
                                        {/if}>
                                {/if}
                                <label
                                    for="wk_checkout_display_order_comment_off">{l s='No' mod='wkonepagecheckout'}</label>
                                <a class="slide-button btn"></a>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <button type="submit" name="submitShipping" class="btn btn-default pull-right">
                        <i class="process-icon-save"></i> {l s='Save' mod='wkonepagecheckout'}
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>