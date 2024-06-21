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
<div id="wk-order-summary-ajax" class="clearfix">
	<article class="mb-5 p-5 bg-white rounded-[5px] clearfix">
		<h4 class="w-max mx-auto font-normal mb-5 tablet:text-2xl text-main-dark text-xl font-main">{l s='Order Summary' mod='wkonepagecheckout'}</h4>
		<div class="text-sm text-main-dark">
			<ul class="wk-cart-items clearfix">
				{if isset($cart.products)}
					{foreach $cart.products as $product}
						<li class="clearfix flex py-3 border-0 border-b first:border-t border-solid border-gray-2000 ">

							<div class="product-line-grid-left shrink-0 basis-1/5 tablet:basis-[15%] tablet-wide:basis-[12%]">
								<div class="pr-2.5 tablet:pr-5 wk-product-img wk-left product-cover w-full">
									{if isset($product.cover) && $product.cover}
										<img class="js-qv-product-cover w-full" {if Configuration::get('WK_CHECKOUT_PRODUCT_IMAGE') == '1'}
											width="50" heigth="50" {else if Configuration::get('WK_CHECKOUT_PRODUCT_IMAGE') == '2'}
											width="80" heigth="80" {else if Configuration::get('WK_CHECKOUT_PRODUCT_IMAGE') == '3'}
											width="100" heigth="100" {else} width="70" heigth="70"
											{/if}
											src="{$product.cover.medium.url}">
										<div class="layer hidden-sm-down" data-toggle="modal"
											data-target="#wk-product-modal-{$product.id_product}">
											<i class="material-icons zoom-in">&#xE8FF;</i>
										</div>
									{else}
										<img {if Configuration::get('WK_CHECKOUT_PRODUCT_IMAGE') == '1'} width="50" heigth="50"
											{else if Configuration::get('WK_CHECKOUT_PRODUCT_IMAGE') == '2'} width="80" heigth="80"
											{else if Configuration::get('WK_CHECKOUT_PRODUCT_IMAGE') == '3'} width="100"
											heigth="100" {else} width="70" heigth="70"
											{/if} class="product-image w-full"
											src="{$wk_opc_modules_dir}img/en.jpg" itemprop="image">
									{/if}
								</div>
							</div>

							<div class="flex flex-wrap w-full">

								<div class="product-line-grid-body shrink-0 basis-[70%] tablet:basis-[40%] tablet-wide:basis-[50%] mb-0">
									<div class="wk-product-detail wk-left "
										data-id-product-attribute="{$product.id_product_attribute}"
										data-id-product="{$product.id_product}">
										<div class="product-line-info">
											<a class="quick-view label !text-main-dark hover:!text-main transition duration-200" data-link-action="quickview"
												data-id-product-attribute="{$product.id_product_attribute}"
												data-id-product="{$product.id_product}" href="{$product.url}"
												target="_blank"
												title="{l s='More Detail' mod='wkonepagecheckout'}">
												<span>{$product.name}</span></a>
										</div>
										{if isset($product.attributes)}
											{foreach $product.attributes as $key => $value}
												<div class="text-xs">
													<span class="wk-attribute">{$key}:</span>
													<span class="wk-attribute-value">{$value}</span>
												</div>
											{/foreach}
										{/if}
										{hook h='displayWkProductPriceBlock' product=$product}
										{include file='module:wkonepagecheckout/views/templates/front/content/_partials/wk_cart_product_customization.tpl'}
										<br />
									</div>
								</div>

								<div class="wk-product-info shrink-0 basis-[70%] order-3 tablet:basis-[20%] tablet:order-2">
									<div class="bootstrap-touchspin tablet:!float-right">
										<input data-id-product-attribute="{$product.id_product_attribute}"
											data-id-product="{$product.id_product}"
											value="{if isset($product.cart_quantity)}{$product.cart_quantity}{/if}"
											class="wk-hidden-qty form-control" type="hidden" id="wk-cart-hidden-qty" min="1" />
										<input data-id-product-attribute="{$product.id_product_attribute}"
											data-id-product="{$product.id_product}"
											value="{if isset($product.cart_quantity)}{$product.cart_quantity}{/if}"
											class="-mr-5 border border-gray-2000 border-solid float-left focus:ring-0 font-normal h-[50px] pl-1 pr-5 py-3 rounded-md text-center text-lg w-[75px] form-control wk-qty" type="text" name="wk-cart-qty" min="1"
											data-id-customization="{if isset($product.id_customization)}{$product.id_customization}{else}0{/if}" />
										<span class="flex flex-col relative z-10">
											<button type="button" class="bg-gray-2000 block bootstrap-touchspin-up border-0 cursor-pointer h-[25px] hover:bg-gray-300 relative rounded-tr-md transition w-5 wk-qty-up">
												<i class="material-icons touchspin-up  absolute w-full top-0 text-xl left-0"></i>
											</button>
											<button type="button" class="bg-gray-2000 block bootstrap-touchspin-down border-0 cursor-pointer h-[25px] hover:bg-gray-300 relative rounded-br-md transition w-5 wk-qty-down">
												<i class="material-icons touchspin-down  absolute w-full bottom-2 text-xl left-0"></i>
											</button>
										</span>
									</div>
								</div>

								<div class="shrink-0 basis-[30%] order-3 tablet:basis-[20%] tablet:order-4">
									<span class="text-base tablet:text-lg text-main-dark float-right">
										{if isset($product.total)}
											<span>{$product.total}</span>
										{/if}
									</span>
								</div>

								<div class="wk-delete-qty !p-0 basis-[30%] tablet:order-4 tablet:basis-[20%] tablet-wide:basis-[10%]">
									<div class="cart-line-product-actions">
										<a title="{l s='Delete' mod='wkonepagecheckout'}" id="wk-remove-cart"
											data-id-product-attribute="{$product.id_product_attribute}"
											data-id-product="{$product.id_product}" href="javascript:void(0);"
											data-quantity="{$product.cart_quantity}"
											data-id-customization="{if isset($product.id_customization)}{$product.id_customization}{else}0{/if}"
											class="remove-from-cart float-right">
											<i class="material-icons font-light text-2xl relative flex justify-center items-center text-gray-3000 tablet:text-main-dark hover:text-main transition"></i>
										</a>
										{hook h='displayWkCartExtraProductActions' product=$product}
										{if Module::isEnabled('wkstripepayment')}
											{if isset($stripeSubscribedProducts) && count($stripeSubscribedProducts)}
												{foreach $stripeSubscribedProducts as $stripeSubscribedProduct}
													{if $stripeSubscribedProduct['id_product'] == $product.id_product && $stripeSubscribedProduct['id_product_attribute'] == $product.id_product_attribute}
														<a class="remove-from-cart" rel="nofollow"
															title="{l s='Remove subscription' mod='wkonepagecheckout'}" href="javascript:void(0);"
															data-link-action="wk-subscribe-delete-from-cart"
															data-id-product="{$product.id_product|escape:'javascript':'UTF-8'}"
															data-id-product-attribute="{$product.id_product_attribute|escape:'javascript':'UTF-8'}"
															data-id-customization="{$product.id_customization|escape:'javascript':'UTF-8'}"><i
																class="material-icons float-xs-left">highlight_off</i>
														</a>
													{/if}
												{{/foreach}}
											{/if}
										{/if}
										{if Module::isEnabled('wksampleproduct')}
											{if isset($wkSampleProducts) && count($wkSampleProducts)}
												{foreach $wkSampleProducts as $wkSampleProduct}
													{if $wkSampleProduct['id_product'] == $product.id_product && $wkSampleProduct['id_product_attribute'] == $product.id_product_attribute}
														<div class="wk_sp_sample_action alert-warning text-xs-center"
															{if !$showNotice}style="display:none;padding:0 7px; float:right;line-height: normal;"
															{else}style="display: inline-block;padding:0 7px;"
															{/if}>
															{l s='Sample' mod='wkonepagecheckout'}
														</div>
													{/if}
												{{/foreach}}
											{/if}
										{/if}
									</div>
								</div>
							
							</div>

							{block name='product_images_modal'}
								{include file='module:wkonepagecheckout/views/templates/front/content/_partials/wk-product-image-modal.tpl'}
							{/block}
						</li>
					{/foreach}
				{/if}
			</ul>
			<div class="wkhide wkerrorcolor wkorder_error"></div>
		</div>
		<p class="wkstyle !border-0"></p>
		{block name='wk-order-total'}
			{include file='module:wkonepagecheckout/views/templates/front/content/_partials/wk_order_total.tpl'}
		{/block}
		<div id="wkorder-summary"></div>
	</article>
</div>
