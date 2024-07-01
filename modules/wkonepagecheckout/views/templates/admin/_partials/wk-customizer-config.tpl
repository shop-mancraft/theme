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
            <i class="icon-paint-brush"></i> {l s='Customizations' mod='wkonepagecheckout'}
        </div>
        <div class="panel-body">
            <form action="{$currentIndex}" class="defaultForm form-horizontal" method="post"
                enctype="multipart/form-data">
                <div class="form-group">
                    <label class="control-label col-lg-3 required">
                        {l s='Checkout button color' mod='wkonepagecheckout'}
                    </label>
                    <div class="input-group col-lg-3">
                        <input type="color" data-hex="true" class="color" name="wk_checkout_button_color"
                            value="{$configValues.WK_CHECKOUT_BUTTON_COLOR}" />
                    </div>
                    <div class="help-block col-md-offset-3">
                        {l s='Button color will change on one page checkout page' mod='wkonepagecheckout'}</div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-3 required">
                        {l s='Checkout button font size' mod='wkonepagecheckout'}
                    </label>
                    <div class="input-group col-lg-3">
                        <input type="text" class="form-control" name="wk_checkout_button_font_size"
                            value="{$configValues.WK_CHECKOUT_BUTTON_FONT_SIZE}" maxlength="2" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-3 required">
                        {l s='Checkout button font color' mod='wkonepagecheckout'}
                    </label>
                    <div class="input-group col-lg-3">
                        <input type="color" data-hex="true" class="form-control" name="wk_checkout_button_font_color"
                            value="{$configValues.WK_CHECKOUT_BUTTON_FONT_COLOR}" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-3">
                        {l s='Checkout button font family' mod='wkonepagecheckout'}
                    </label>
                    <div class="input-group col-lg-5">
                        <select name="wk_checkout_button_font_family">
                            <option value="1" {if $configValues.WK_CHECKOUT_BUTTON_FONT_FAMILY == 1} selected="selected"
                                {/if}>
                                Arial, Helvetica, sans-serif
                            </option>
                            <option value="2" {if $configValues.WK_CHECKOUT_BUTTON_FONT_FAMILY == 2} selected="selected"
                                {/if}>
                                Comic Sans MS,cursive,sans-serif
                            </option>
                            <option value="3" {if $configValues.WK_CHECKOUT_BUTTON_FONT_FAMILY == 3} selected="selected"
                                {/if}>
                                Lucida Sans Unicode, Lucida Grande, sans-serif
                            </option>
                            <option value="4" {if $configValues.WK_CHECKOUT_BUTTON_FONT_FAMILY == 4} selected="selected"
                                {/if}>
                                Courier New, Courier, monospace
                            </option>
                            <option value="5" {if $configValues.WK_CHECKOUT_BUTTON_FONT_FAMILY == 5} selected="selected"
                                {/if}>
                                Lucida Console, Monaco, monospace
                            </option>
                            <option value="6" {if $configValues.WK_CHECKOUT_BUTTON_FONT_FAMILY == 6} selected="selected"
                                {/if}>
                                Montserrat, sans-serif
                            </option>
                        </select>
                    </div>
                </div>
                <div class="panel-footer">
                    <button type="submit" name="submitCustomizer" class="btn btn-default pull-right">
                        <i class="process-icon-save"></i> {l s='Save' mod='wkonepagecheckout'}
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>