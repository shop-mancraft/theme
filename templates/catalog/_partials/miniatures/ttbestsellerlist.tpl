{**
 * 2007-2020 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{block name='product_miniature_item'}
<article class="swiper-slide product-miniature js-product-miniature product-grid relative px-4 float-left tablet:w-3/12 phone-wide:w-1/2 w-full" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
	<div class="thumbnail-container">
	<div class="ttimge-bg"></div>
		<div class="ttproduct-image">
			{block name='product_thumbnail'}
				{if $product.cover}
					<a href="{$product.url}" class="thumbnail product-thumbnail">
						<img
							class="ttproduct-img1 js-qv-product-cover-img"
							src = "{$product.cover.bySize.home_default.url}"
							width="300"
							height="300"
							alt = "{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
								loading="lazy"
						>
					</a>
				{else}
					<a href="{$product.url}" class="thumbnail product-thumbnail">
						<img
							class="ttproduct-img1 js-qv-product-cover-img"
							src = "{$urls.no_picture_image.bySize.home_default.url}"
							loading="lazy"
						>
					</a>
				{/if}
			{/block}
			{block name='product_flags'}
				<ul class="product-flags">
					{foreach from=$product.flags item=flag}
						<li class="{$flag.type}">{$flag.label}</li>
					{/foreach}
				</ul>
			{/block}
				{block name='product_reviews'}
					{hook h='displayProductListReviews' product=$product}
				{/block}
			{hook h='displayTtWishListButton' product=$product}
		</div>
		<div class="ttproduct-desc">
			<div class="product-description">
				<h5 class="cat-name">{$product.category|escape:'html':'UTF-8'}</h5>

				{block name='product_name'}
					{if $page.page_name == 'index'}
						<span class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name}</a></span>
					{else}
						<span class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name}</a></span>
					{/if}
				{/block}

				{block name='product_description_short'}
					<div class="product-desc-short" itemprop="description">{$product.description_short|strip_tags:'UTF-8'|truncate:96:'...' nofilter}</div>
				{/block}
		
				{block name='product_price_and_shipping'}
					{if $product.show_price}
						<div class="product-price-and-shipping">
							<span itemprop="price" class="price">{$product.price}</span>
							{if $product.has_discount}
								{hook h='displayProductPriceBlock' product=$product type="old_price"}
								<span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
								{if $product.discount_type === 'percentage'}
								 <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
							{elseif $product.discount_type === 'amount'}
								 <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
							{/if}
								<span class="regular-price">{$product.regular_price}</span>
							{/if}
							{hook h='displayProductPriceBlock' product=$product type="before_price"}
							<span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
							{hook h='displayProductPriceBlock' product=$product type='unit_price'}
							{hook h='displayProductPriceBlock' product=$product type='weight'}
						</div>
					{/if}
				{/block}
				<div class="highlighted-informations{if !$product.main_variants} no-variants{/if} hidden-sm-down">
				{block name='product_variants'}
					{if $product.main_variants}
						{include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
					{/if}
				{/block}
			</div>
			</div>
			<div class="ttproducthover">
			<div class="tt-button-container">
				{include file='catalog/_partials/customize/button-cart.tpl' product=$product}
			</div>
			{hook h='displayTtCompareButton' product=$product}
			{block name='quick_view'}
				<div class="quick-view-block">
					<a href="#" class="quick-view btn" data-link-action="quickview" title="{l s='Quick view' d='Shop.Theme.Actions'}}">
						<i class="material-icons search">search</i> <span>{l s='Quick view' d='Shop.Theme.Actions'}</span>
					</a>
				</div>
			{/block}
			</div>
						{hook h='displayProductCountdown' product=$product}
		</div>
	</div>
</article>
{/block}