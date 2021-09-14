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
<div id="_desktop_cart" class="order-10">
  <div class="blockcart cart-preview {if $cart.products_count > 0}active{else}inactive{/if}" data-refresh-url="{$refresh_url}">
    <div class="header">
        <a href="{$urls.pages.cart}?action=show" rel="nofollow">
					<svg class="absolute inset-0 my-auto ml-2" width="25px" height="25px" viewBox="0 0 8892 8892" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd" stroke-linejoin="round" stroke-miterlimit="2"><path d="M2707.37 5484.71h4138.4c581.221 0 1055.34-445.7 1055.34-991.679v-1852.67c0-3.933 0-7.866-1.845-12.004 0-3.725-1.921-9.729-1.921-13.558 0-4.138-1.884-7.967-1.884-11.9-1.845-3.725-1.845-7.762-3.766-13.558-1.921-4.034-1.921-7.863-3.842-11.796-1.846-4.034-1.846-7.763-3.733-11.796-1.921-4.038-3.767-7.867-5.688-13.558-1.883-4.034-3.804-8.175-5.725-10.038-1.846-4.033-3.766-7.758-5.65-11.9-1.846-3.933-3.771-5.796-5.654-9.625-1.921-4.137-5.687-7.862-7.608-12.004-1.846-3.725-3.767-5.896-7.571-9.829-1.846-3.829-5.692-5.9-7.575-9.729-1.846-3.83-5.65-5.792-7.571-9.83-1.846-4.141-5.65-6.104-7.496-7.762-3.846-3.933-5.766-6.104-9.496-9.933-3.766-1.863-5.687-5.796-9.491-7.867-3.767-1.863-7.575-6-11.342-7.863-3.842-1.862-5.687-3.829-9.492-5.691-3.766-2.175-7.575-4.038-11.341-8.071-3.804-1.863-7.571-4.038-11.375-6.004-3.767-1.967-7.538-3.725-11.342-5.796-3.767-1.863-7.571-3.829-11.337-5.792-3.809-1.866-7.575-1.866-11.38-4.037-3.766-1.759-9.454-3.725-13.262-3.725-3.767 0-7.571-1.967-9.492-1.967-5.65-1.967-9.416-1.967-15.071-1.967-1.92 0-3.841-2.07-7.608-2.07l-5444.67-921.313V548.336c0-9.933 0-19.662-1.845-27.525 0-2.07 0-3.829-1.921-7.866 0-5.9-1.884-11.796-1.884-17.8-1.883-5.692-1.883-9.625-3.804-15.521 0-4.038-1.883-6.004-1.883-10.038-1.883-5.487-3.767-11.695-5.65-17.695 0-1.863-1.958-5.588-1.958-7.659-1.846-5.796-3.734-9.933-7.5-15.625-1.921-2.175-1.921-6.004-3.805-8.075-1.92-3.725-3.766-7.758-7.608-11.587-1.883-4.038-3.767-6.109-5.654-9.934-1.883-3.829-3.767-5.9-5.65-9.729-1.921-3.933-5.688-7.762-7.608-11.796-1.884-2.175-3.805-3.933-5.65-6.108-3.809-3.621-7.613-7.658-11.38-11.383-1.883-2.275-3.766-4.242-5.687-6.104-3.767-4.038-7.575-7.867-13.225-11.796-1.921-2.175-5.688-4.038-7.571-5.796-3.804-4.142-7.612-6.104-11.379-9.933-5.65-4.142-11.375-7.867-15.142-9.834-1.887-2.171-3.808-2.171-5.654-4.033-7.608-3.829-17.067-7.867-24.637-11.696l-736.7-279.821c-130.613-56.912-280.175 5.9-335.063 141.671-54.892 135.254 5.688 290.583 136.3 347.396l579.6 213.071v5470.75c0 550.016 397.529 1005.76 910.488 1074.47-92.75 161.02-147.642 349.775-147.642 549.912 0 591.304 463.796 1070.64 1031.64 1070.64 567.925 0 1031.68-481.3 1031.68-1070.64 0-196.308-51.125-382.787-141.992-540.083h1310.5c-90.904 159.054-141.991 343.775-141.991 540.083 0 591.304 463.795 1070.64 1031.68 1070.64 567.846 0 1031.64-481.3 1031.64-1070.64 0-589.342-463.796-1070.75-1031.64-1070.75h-3839.47c-295.279 0-533.791-249.187-533.791-553.637l-66.867-846.084c156.796 86.513 342.258 136.909 539.217 136.909l-.017.012zm1333.52 2331.38c0 298.962-234.742 540.391-520.567 540.391-285.829 0-520.571-243.496-520.571-540.391 0-296.171 234.742-539.875 520.571-539.875 285.825 0 520.567 241.633 520.567 539.875zm3089.8 0c0 298.962-234.704 540.391-520.567 540.391-285.829 0-520.533-243.496-520.533-540.391 0-296.171 234.704-539.875 520.533-539.875 285.863 0 520.567 241.633 520.567 539.875zm-284.921-2816.62h-4138.4c-298.258 0-539.217-228.388-539.217-506.446l66.829-1259.29v-1219.87l5155.04 877.954-5.158 1599.44c0 281.787-242.767 508.208-539.105 508.208h.009z" fill="#fff" fill-rule="nonzero"/></svg>
					<span class="hidden-sm-down text-white">{l s='Checkout' d='Shop.Theme.Checkout'}</span>
					<span class="cart-products-count">{$cart.products_count}</span>
        </a>
    </div>
	<div class="cart_block block exclusive" style="max-height: 300px;overflow: auto;">
	<div class="block_content">
	<div class="cart_block_list">
			{if $cart.products}
			{foreach from=$cart.products item='products'}
				<div class="products">
				<div class="img">
			{block name='product_thumbnail'}
				<a href="{$products.url}" class="thumbnail product-thumbnail">
					<img
					src = "{$products.cover.bySize.small_default.url}"
					alt = "{$products.cover.legend}"
					data-full-size-image-url = "{$products.cover.large.url}"
					class=""
				/>
				</a>
			{/block}
			</div>
			<div class="cart-info">
				<h2 class="h2 productname" itemprop="name">
					<a href="{$products.url}">{$products.name|truncate:16:'...'}</a>
				</h2>
			<div class="ttPrice">
				<span class="quantity">{$products.quantity}X</span>
				<span class="price">{$products.price}</span>
			</div>
				{foreach from=$products.attributes item="value"}
					<div class="product-line-info">
						<span class="value">{$value}</span>
					</div>
				{/foreach}
			</div>
				<p class="remove_link">
					<a rel="nofollow" href="{$products.remove_from_cart_url}"><i class="material-icons">close</i></a>
				</p>	
			</div>
			{/foreach}
				<div class="cart-prices">
					<span class="total pull-left">
						{l s='Total:' d='Shop.Theme.Checkout'}
					</span>
					{if $cart.totals.total.value}
						<span class="amount pull-right">
							{$cart.totals.total.value}
						</span>
					{else}
						<span class="amount pull-right">
							{Product::convertAndFormatPrice(0.00)}
						</span>
					{/if}
				</div>
				<div class="cart-buttons">
					<a rel="nofollow" href="{$cart_url}" class="btn-primary">
						{l s='Check out' d='Shop.Theme.Checkout'} <i class="ion-chevron-right"></i>
					</a>
				</div>
			{else}
			<p class="no-item">
				{l s='No products in the cart.' d='Shop.Theme.Checkout'}
			</p>
			{/if}
		</div>
		</div>
		</div>
  </div>
</div>
