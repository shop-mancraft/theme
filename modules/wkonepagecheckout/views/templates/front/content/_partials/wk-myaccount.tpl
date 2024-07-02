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
<div class="wk-address-block">

	<div class="" id="wk-existing-delivery">
		<h5 class="text-xl font-normal text-left mb-5">{l s='Delivery Address' mod='wkonepagecheckout'}</h5>
		{block name='wk_existing_delivery_address'}
			{include file="module:wkonepagecheckout/views/templates/front/content/_partials/wk_existing_delivery_address.tpl"}
		{/block}

		<!-- Add new delivery address -->
		<div class="box {if $customer.addresses|count > 0}wkhide{/if}" id="wk-new-delivery">
			{block name='wk_delivery_address'}
				{include file="module:wkonepagecheckout/views/templates/front/content/_partials/wk_delivery_address.tpl"}
			{/block}
		</div>
		<div class="form-group {if $customer.addresses|count == 0}hidden{/if}">
			<label class="cursor-pointer text-xs align-middle">
				<input type="checkbox" name="wk-different-invoice" value="1" class="mr-2 bg-black border border-[#64635D] border-solid checked:bg-main checked:focus:bg-main checked:hover:bg-main focus:ring-0 focus:ring-transparent form-checkbox w-5 h-5 rounded-[5px] appearance-none  opacity-100 outline-none rounded transition" {if Configuration::get('WK_CHECKOUT_DELIVERY_AS_INVOICE')  && $cart.id_address_delivery == $cart.id_address_invoice}checked="checked"{/if}>
				{l s='Use this address for invoice too' d='Shop.Theme.Checkout'}
			</label>
		</div>
	</div>

	<div id="wk-existing-invoice" class="hidden">
		<h5 class="text-xl font-normal text-left mb-5">{l s='Invoice Address' mod='wkonepagecheckout'}</h5>
		{block name='wk_existing_invoice_address'}
			{include file="module:wkonepagecheckout/views/templates/front/content/_partials/wk_existing_invoice_address.tpl"}
		{/block}

		<!-- Add new invoice address -->
		<div class="box {if $customer.addresses|count > 0}wkhide{/if}" id="wk-new-invoice">
			{block name='wk_invoice_address'}
				{include file="module:wkonepagecheckout/views/templates/front/content/_partials/wk_invoice_address.tpl"}
			{/block}
		</div>
	</div>

</div>