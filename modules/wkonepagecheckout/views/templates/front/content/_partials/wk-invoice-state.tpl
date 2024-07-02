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
<div class="clearfix form-group">
    <label class="label-control">{l s='State' mod='wkonepagecheckout'}</label>
    <select name="wk_invoice_address_state" class="form-control wk_address_state bg-white border border-[#64635D] focus:border-gray-3000 focus:ring-0 font-body font-medium form-control-select form-select js-country pl-4 rounded-full w-full" data-attr="invoice">
        {foreach $states as $state}
            <option
                {if isset($delivery_address)}
                    {if $delivery_address->id_state == $state.id_state}selected="selected"{/if}
                {else if isset($cartAddress)}
                    {if $cartAddress->id_state == $state.id_state}selected="selected"{/if}
                {/if}
                value="{$state.id_state}">
                {$state.name}
            </option>
        {/foreach}
    </select>
</div>
