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

<section class="ttspecial-products clearfix col-sm-6">
	<div class="tt-titletab">
		<h3 class="tt-title">{l s='Big offers' d='Shop.ttspecials'}</h3>
	</div>
  
  <p class="text-left mb-3">{l s='High quality HPA Airsoft products and professional Airsoft components at very good prices.' d='Shop.Theme.Global'}</p>
  
  <div class="ttspecial-list">
    {if $tt_total > 1}
      <div class="customNavigation">
        <a class="btn prev ttspecial_prev">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="width: 22px;margin: 3px 2px;">
            <path d="M15.41 16.59 10.83 12l4.58-4.59L14 6l-6 6 6 6 1.41-1.41z" fill="#fff"/>
          </svg>
        </a>
        <a class="btn next ttspecial_next">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="width: 22px;margin: 3px 2px;">
            <path d="M8.59 16.59 13.17 12 8.59 7.41 10 6l6 6-6 6-1.41-1.41z" fill="#fff"/>
          </svg>
        </a>
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
   <div class="allproduct"><a href="{$allSpecialProductsLink}">{l s='All sale products'  d='Shop.ttspecials'}</a></div>
</section>
