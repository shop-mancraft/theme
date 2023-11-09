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

<!-- Block Top links module -->
<div id="tttop-link-block" class="w-auto col-sm-7">
	<h3 class="title_block ">{l s='Best in offer' mod='tttoplink'}</h3>
	<ul id="tttoplink" class="block_content">
	{foreach from=$tttoplink_links item=tttoplink_link}
		{if isset($tttoplink_link.$lang)} 
			<li class="tttoplink">
				<a href="
				{if $tttoplink_link.url == '/promotions' && $language.id == 1}/pl/promocje{/if}{if $tttoplink_link.url == '/promotions' && $language.id == 2}/en/price-drop{/if}
				{if $tttoplink_link.url == '/best-sales' && $language.id == 1}/pl/najczesciej-kupowane{/if}{if $tttoplink_link.url == '/best-sales' && $language.id == 2}/en/best-sales{/if}
				{if $tttoplink_link.url == '/new-products' && $language.id == 1}/pl/nowe-produkty{/if}{if $tttoplink_link.url == '/new-products' && $language.id == 2}/en/new-products{/if}
				{if $tttoplink_link.url == '/contact-us' && $language.id == 1}/pl/kontakt{/if}{if $tttoplink_link.url == '/contact-us' && $language.id == 2}/en/contact-us{/if}
				{if $tttoplink_link.url == '/distributors-map' && $language.id == 1}/pl/mapa-dystrybutorow{/if}{if $tttoplink_link.url == '/distributors-map' && $language.id == 2}/en/distributors-map{/if}
				{if $tttoplink_link.url == '/module/smartblog/category' && $language.id == 1}/pl/instrukcje-montazu{/if}{if $tttoplink_link.url == '/module/smartblog/category' && $language.id == 2}/en/assembly-guide{/if}
				{if $tttoplink_link.url != '/promotions' && $tttoplink_link.url != '/best-sales' && $tttoplink_link.url != '/new-products' && $tttoplink_link.url != '/contact-us' && $tttoplink_link.url != '/distributors-map' && $tttoplink_link.url != '/module/smartblog/category'}{$tttoplink_link.url}{/if}
				" title="{$tttoplink_link.$lang}" {if $tttoplink_link.newWindow}target="_blank"{/if}>{$tttoplink_link.$lang}</a>
			</li>
		{/if}
	{/foreach}
	</ul>
</div>
<!-- /Block Top links module -->
