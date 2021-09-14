{*
* 2007-2020 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
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
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2020 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{assign var="tt_cnt" value="1"}
{assign var="tt_total" value="0"}
{foreach from=$products item="product"}
	{$tt_total = $tt_total+1}
{/foreach}

<section class="ttnewproducts-products ttspecial-products clearfix col-sm-6">
	<div class="tt-titletab">
		<h3 class="tt-title">{l s='New products' d='Shop.Theme.Global'}</h3>
	</div>
    <p style="text-align:left;">{l s='Innovative HPA systems, new Airsoft components, upgrades of mancraft products.' d='Shop.Theme.Global'}</p>
  <div class="ttspecial-list">
    {if $tt_total > 1}
			<div class="customNavigation">
				<a class="btn prev ttnewproducts_prev">{l s='Prev' d='Shop.Theme.Global'}</a>
				<a class="btn next ttnewproducts_next">{l s='Next' d='Shop.Theme.Global'}</a>
			</div>
		{/if}

		<div class="row">
			<div class="products">
				{foreach from=$products item="product"}
					{include file="catalog/_partials/miniatures/ttproduct.tpl" product=$product}
				{/foreach}
			</div>
		</div>
  </div>
</section>
