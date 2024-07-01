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
<div id="wk-invoice-address-form">
	{if isset($addressFormFields)}
	<div class="wk-invoice-address-form wk_div_container">
		<form class="wk-address-form flex flex-wrap" method="POST" action="#" id="wk-invoice-form" data-type="invoice">
			<input type="hidden" name="data-type" value="invoice" id="invoice">
			<input type="hidden" name="id-new-invoice-address" value="{if isset($delivery_address)}{$delivery_address->id}{/if}" id="id-new-invoice-address">

			{foreach from=$addressFormFields item=field key=fieldName}
				{if !in_array($fieldName, ['country', 'state', 'alias']) && $field}
					{if $fieldName == 'company'}

						<div id="company" class="w-full">
						  <a class="block border-b text-main-dark w-full mx-5 mb-2 tablet:mb-5 hover:text-main transition text-sm collapsed font-body [&:not(.collapsed)_.shrinkable]:scale-y-0" data-toggle="collapse" href="#collapseCompanyInv" role="button" aria-expanded="false" aria-controls="collapseCompanyInv">
						  <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="none"><path fill="#181828" d="M0 5h12v1H0z"></path><path class="shrinkable transition duration-300" fill="#181828" d="M5 0v12H6V0z" class=""></path></svg>
							{l s='Add tax identification number and company name' d='Shop.Theme.Checkout'}
						  </a>
						  <div class="collapse" id="collapseCompanyInv">

					{/if}

				<div class="form-group w-1/2 {if $fieldName == 'company' || $fieldName == 'vat_number' }float-left{/if} input-{$fieldName}">
						<input
							maxlength="{$field.maxlength}"
							{if $field.required}data-required="1"{else}data-required="0"{/if}
							data-validate="{$field.validate}"
							type="text"
							name="{$field.invoice_field_name}"
							id="{$field.invoice_field_name}"
							value="{if isset($delivery_address)}{$delivery_address->{$field.db_fieldname}}{/if}"
							placeholder="{$field.label}{if $field.required} *{/if}"
							class="form-control wkvalidatefield border-gray-2000 border-solid border rounded-full bg-white h-[50px] tablet:h-10">
						<i class="material-icons wk-check-icon wkhide icon_{$field.invoice_field_name}">&#xE876;</i>
						<i class="material-icons wk-error-icon wkhide error_{$field.invoice_field_name}">&#xE001;</i>
						<span class="help-block wk-error {$field.invoice_field_name}"></span>
					</div>

					{if $fieldName == 'vat_number' }
						</div>
					  </div>

					{/if}

				{elseif $fieldName == 'country'}
					<div class="form-group w-full">
						<select
							data-attr="invoice"
							name="wk_invoice_address_country"
							class="form-control wk_address_country text-sm font-normal border-solid bg-white border border-gray-2000 focus:border-gray-3000 focus:ring-0 font-body font-medium form-control-select form-select js-country pl-4 rounded-full w-full h-[50px] tablet:h-10">
							{if isset($countries)}
								{foreach $countries as $country}
									<option
										{if isset($updateCountry)}
											{if $updateCountry == $country.id_country}selected="selected"{/if}
										{else if isset($delivery_address)}
											{if $delivery_address->id_country == $country.id_country}selected="selected"{/if}
										{else if isset($cartAddress)}
											{if $cartAddress->id_country == $country.id_country}selected="selected"{/if}
										{else if $defaultCountry == $country.id_country}selected="selected"{/if}
										value="{$country.id_country}">{$country.name}</option>
								{/foreach}
							{/if}
						</select>
					</div>
				{elseif $fieldName == 'state'}
					<div id="wk-invoice-country-state">
						{if isset($states) && $states}
							{block name='wk_delivery_state'}
								{include file="module:wkonepagecheckout/views/templates/front/content/_partials/wk-invoice-state.tpl"}
							{/block}
						{/if}
					</div>
				{/if}
			{/foreach}

			<div class="form-group w-full" style="text-align: right;">
				{if Module::isEnabled('wkgdpr')}
					{hook h='displayGDPRConsent' mod='wkgdpr' id_module=$id_module}
				{else}
					{hook h='displayGDPRConsent' mod='psgdpr' id_module=$id_module}
				{/if}
				<button type="submit" class="btn bg-transparent py-3 px-4 border-2 text-main-dark uppercase border-main-dark hover:bg-main-dark hover:text-white rounded-full border-solid  transition font-body text-xs font-normal wk-save-address">
					{l s='Save' mod='wkonepagecheckout'}
				</button>
				<div class="wkhide wk_text-light wkbotton" id="wk-msg-new-invoice"></div>
			</div>
		</form>
	</div>
	{/if}
</div>
