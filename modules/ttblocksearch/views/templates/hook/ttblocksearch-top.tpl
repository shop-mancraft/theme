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
*  @version  Release: $Revision$
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{if isset($hook_mobile)}
<div class="input_search" data-role="fieldcontain">
	<form method="get" action="{$link->getPageLink('search', true)|escape:'html':'UTF-8'}" id="searchbox">
		<input type="hidden" name="controller" value="search" />
		<input type="hidden" name="orderby" value="position" />
		<input type="hidden" name="orderway" value="desc" />
		<input class="search_query" type="search" id="search_query_top" name="search_query" placeholder="{l s='Search entire store...' mod='ttblocksearch'}" value="{$search_query|escape:'html':'UTF-8'|stripslashes}" />
	</form>
</div>
{else}
<!-- Block search module TOP -->

<div id="search_block_top"  class="col-sm-7">
	<form id="searchbox" method="get" action="{$search_controller_url|escape:'html':'UTF-8'}">
       <div class="ttsearch-main">
		<input type="hidden" name="controller" value="search">
		<input type="hidden" name="orderby" value="position" />
		<input type="hidden" name="orderway" value="desc" />
		<div class="select-wrapper">
        <select id="search_category" name="search_category" class="form-control">
            <option value="all">{l s='All Categories' mod='ttblocksearch'}</option>
            {$search_category|escape:'quotes':'UTF-8' nofilter}   
        </select>
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"  class="arrow">
					<path d="M0 0h24v24H0z" fill="none"/>
					<path d="M16.59 8.59 12 13.17 7.41 8.59 6 10l6 6 6-6z" fill="#555"/>
				</svg>
		</div>
		<input class="search_query form-control" type="text" id="search_query_top" name="s" placeholder="{l s='Search here...' mod='ttblocksearch'}" value="{$search_query|escape:'htmlall':'UTF-8'|stripslashes}" />
		

		<div id="tt_url_ajax_search" style="display:none">
		<input type="hidden" value="{$base_ssl|escape:'html':'UTF-8'}/controller_ajax_search.php" class="url_ajax" />
		</div>
		</div>
		<button type="submit" name="submit_search" class="btn btn-default button-search">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="width: 18px;" class="inline">
				<path d="M0 0h24v24H0z" fill="none"/>
				<path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z" fill="#fff"/>
			</svg>
			<span>{l s='Search' mod='ttblocksearch'}</span>
		</button>
	</form>
	</div>
{/if}

<script type="text/javascript">
var limit_character = "<p class='limit'>{l s='Number of characters at least are 3' mod='ttblocksearch'}</p>";
var close_text = "{l s='close' mod='ttblocksearch'}";
</script>
<!-- /Block search module TOP -->
