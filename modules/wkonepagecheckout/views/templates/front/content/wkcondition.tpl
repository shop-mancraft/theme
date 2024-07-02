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

<div class="wk-condition wk-box">
    <article>
    {if $conditions_to_approve|count}
        <p class="ps-hidden-by-js">
            {l s='By confirming the order, you certify that you have read and agree with all of the conditions below:' mod='wkonepagecheckout'}
        </p>

        {if Configuration::get('PS_RECYCLABLE_PACK')}
            <div class="custom-checkbox-wrapper">
                <div class="float-xs-left">
                    <span class="custom-checkbox">
                        <input
                            class="js-gift-checkbox"
                            id="input_recyclable"
                            name="recyclable"
                            type="checkbox"
                            value="1" {if isset($recyclable) && ($recyclable == 1)}checked{/if}>
                            <span><i class="material-icons checkbox-checked">&#xE5CA;</i></span>
                    </span>
                </div>
                <label for="input_recyclable" style="padding-left:1.625rem;">
                    {l s='I would like to receive my order in recycled packaging.' mod='wkonepagecheckout'}
                </label>
            </div>
        {/if}

        {if Configuration::get('PS_GIFT_WRAPPING')}
            <div class="wk-gift-section">
                <div class="custom-checkbox-wrapper">
                    <div class="float-xs-left">
                        <span class="custom-checkbox">
                            <input
                                class="js-gift-checkbox"
                                id="input_gift"
                                name="gift"
                                type="checkbox"
                                value="1" {if isset($gift) && ($gift == 1)}checked{/if}>
                                <span><i class="material-icons checkbox-checked">&#xE5CA;</i></span>
                        </span>
                    </div>
                    <label for="input_gift" style="padding-left:1.625rem;">
                        {l s='I would like my order to be gift wrapped (additional cost of %s tax excl.)' sprintf=[$gift_price] mod='wkonepagecheckout'}
                    </label>
                </div>
                <div id="wkgift" style="{if isset($gift) && ($gift == 1)}display:block;{else}display:none;{/if}">
                    <label for="gift_message">{l s='If you wish, you can add a note to your gift:' mod='wkonepagecheckout'}</label>
                    <textarea rows="2" cols="120" id="gift_message" name="gift_message" class="form-control">{if isset($gift_message)}{$gift_message}{/if}</textarea>
                </div>
            </div>
        {/if}

        <form id="conditions-to-approve" method="GET">
            <ul>
            {foreach from=$conditions_to_approve item="condition" key="condition_name"}
                <li class="flex">
                    <div class="float-xs-left shrink-0">
                        <span>
                            <input
                                id="conditions_to_approve[{$condition_name}]"
                                name="conditions_to_approve[{$condition_name}]"
                                required
                                type="checkbox"
                                value="1"
                                class="ps-shown-by-js wk-condition-check form-checkbox w-4 h-4 rounded-[5px] appearance-none   cursor-pointer bg-black border-2 border-[#64635D] border-solid checked:bg-main checked:focus:bg-main checked:hover:bg-main  focus:ring-0 focus:ring-transparent form-checkbox w-4 h-4 rounded-[5px] appearance-none  opacity-100 outline-none rounded transition">
                        </span>
                    </div>
                    <div>
                        <label class="cursor-pointer block pl-3 js-terms text-xs text-gray-dark text-left mb-3" for="conditions_to_approve[{$condition_name}]">{$condition nofilter}</label>
                    </div>
                </li>
            {/foreach}
            </ul>
        </form>
    {/if}
    <div id="payment-confirmation">
        <div class="ps-shown-by-js">
            <button type="submit" class="max-w-[290px] bg-main border-0 cursor-pointer font-body font-normal h-full hover:bg-[#87ac20] block mx-auto overflow-hidden phone-wide:text-base px-6 py-3 relative rounded-[5px] tablet:text-xl text-base text-center text-white transition uppercase duration-200">
                {l s='Place Order' mod='wkonepagecheckout'}
            </button>
        </div>
    </div>

    {* Danger : - Dont't alter this div, we have used this div to append prestashop button to make payment *}
    <div class="wk_ps_payment_button wkhide"></div>
    {*  *}
    <p class="max-w-[320px] mx-auto text-center text-xs text-main-dark mb-3 mt-2 [&_a]:text-main-dark [&_a:hover]:text-main [&_a]:transition">
        {l s='By clicking the "Place order" button, you agree to the Terms and Conditions of Sale and agree to the Privacy Policy.' d='Shop.Theme.Checkout'}
    </p>
    {hook h='displayPaymentByBinaries'}
    <div id="wkcondition_info"></div>
    </article>
</div>

{* Load CMS pop for terms and condition*}
<div class="modal fade" id="modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
            </button>
            <div class="js-modal-content"></div>
        </div>
    </div>
</div>
<style>
.wkcustomizerbtn {
    background-color : {Configuration::get('WK_CHECKOUT_BUTTON_COLOR')} !important;
    font-size: {Configuration::get('WK_CHECKOUT_BUTTON_FONT_SIZE')}px !important;
    color: {Configuration::get('WK_CHECKOUT_BUTTON_FONT_COLOR')} !important;
    font-family: {$fontfamily} !important;
}

</style>
