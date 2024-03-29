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
{if Hook::getModulesFromHook(Hook::getIdByName("header_banner")) != null}
	<div class="header-banner">
		{Hook::exec("header_banner")} 
	</div>
{else}
{/if}

{block name='header_nav'}
  <nav class="header-nav">
		<div class="hidden tablet-narrow:block w-full bg-white float-left border-0 border-t-[3px] tablet-narrow:border-t-[5px] border-main">
			<div class="container">
				{hook h='displayNav1'}
			</div>
		</div>
		<div id="right-nav-header" class="w-full float-left">
			<div class="container text-center">
			<div class="top-logo" id="_mobile_logo"></div>
				<div class="col-sm-3 hidden-sm-down" id="_desktop_logo">
					{if $page.page_name == 'index'}
						<h1>
					{/if}

					<a href="{$urls.base_url}{$language.iso_code}">
						<svg role="img" class="w-full" aria-label="{$shop.name}" viewBox="0 0 1327 170" xmlns="http://www.w3.org/2000/svg" xml:space="preserve">
							<title>{$shop.name}</title>
							<path fill="#fff" fill-rule="nonzero" d="m1030.69 157.75 4.227 2.181-.894 5.068-5.161-2.566-.471 1.989h-27.185l2.342-13.28h1.443l1.731-9.815h25.782l-1.177 6.672h-6.135l.3-1.7h-13.512l-.611 3.464 13.56 5.87.537-3.047h6.135l-.911 5.164Zm222.555-16.423h-6.255l-3.4 19.278h6.255l3.4-19.278Zm-486.16 0h-6.255l-3.4 19.278h6.255l3.4-19.278Zm142.322 0h-6.255l-3.399 19.278h6.255l3.399-19.278Zm298.712 0h-6.255l-3.4 19.278h6.255l3.4-19.278Zm-131.231 9.334 11.389-9.334h6.456l-3.399 19.278h-6.255l2.058-11.676-11.618 9.495-8.315-9.463-2.053 11.644h-6.215l3.399-19.278h6.416l8.137 9.334Zm201.555 4.146 2.375-13.472h6.295l-3.393 19.246h-8.42l-11.848-13.537-2.387 13.537h-6.215l3.394-19.246h8.42l11.779 13.472Zm-486.16 0 2.375-13.472h6.295l-3.393 19.246h-8.421l-11.847-13.537-2.387 13.537h-6.215l3.394-19.246h8.42l11.779 13.472Zm142.322 0 2.376-13.472h6.295l-3.394 19.246h-8.42l-11.847-13.537-2.387 13.537h-6.215l3.393-19.246h8.421l11.778 13.472Zm386.38-13.472-1.148 6.511h-6.295l.266-1.507h-16.36l-1.629 9.238h16.36l.271-1.54h-6.255l.883-5.004h12.55l-2.037 11.548h-28.869l3.394-19.246h28.869Zm-607.698 13.472 2.375-13.472h6.295l-3.393 19.246h-8.421l-11.847-13.537-2.387 13.537h-6.215l3.394-19.246h8.42l11.779 13.472Zm520.03 0 2.375-13.472h6.295l-3.393 19.246h-8.42l-11.848-13.537-2.387 13.537h-6.214l3.393-19.246h8.42l11.779 13.472Zm-256.17-13.472-1.148 6.511h-6.295l.266-1.507h-16.359l-1.629 9.238h16.359l.271-1.54h-6.255l.883-5.004h12.55l-2.036 11.548h-28.87l3.394-19.246h28.869Zm213.5 0h6.215l-3.394 19.246h-6.215l1.256-7.121h-17.041l-1.256 7.121h-6.215l3.394-19.246h6.215l-1.256 7.121h17.041l1.256-7.121Zm-434.82 0-1.148 6.511h-6.295l.266-1.507h-16.359l-1.629 9.238h16.359l.271-1.54h-6.255l.883-5.004h12.55l-2.036 11.548h-28.87l3.394-19.246h28.869Zm-252.593-.008-2.392 13.568h-6.255l3.549 3.978-.3 1.7h-6.415l-4.974-5.678-8.265.032c.08 0 .109.064.086.193-.04 0-.08 0-.114-.032l-.968 5.485h-6.215l3.394-19.246h28.869Zm72.716 0h26.664l-.883 5.004h-20.368l-.374 2.117h16.4l-.883 5.004h-16.399l-1.256 7.121h-6.295l3.394-19.246Zm-146.709 0h28.869l-3.394 19.246h-6.295l.973-5.517h-16.359l-.973 5.517h-6.215l3.394-19.246Zm468.91 0-2.392 13.568h-6.255l3.549 3.978-.3 1.7h-6.416l-4.973-5.678-8.265.032c.08 0 .109.064.086.193-.04 0-.08 0-.115-.032l-.967 5.485h-6.215l3.394-19.246h28.869Zm201.581 0h28.869l-3.393 19.246h-6.295l.973-5.517h-16.36l-.973 5.517h-6.214l3.393-19.246Zm-630.366 0h-6.255l-3.394 19.246h6.255l3.394-19.246Zm135.734 0h28.869l-.882 5.004H621.78l-2.512 14.242h-6.255l2.512-14.242h-11.308l.883-5.004Zm82.987 0-.882 5.004h-20.369l-.374 2.117h16.4l-.883 5.004H665.58l-.373 2.117h20.369l-.883 5.004h-26.664l3.394-19.246h26.664Zm144.531 0-.882 5.004h-20.369l-.374 2.117h16.4l-.883 5.004h-16.399l-.373 2.117h20.369l-.883 5.004H802.56l3.394-19.246h26.664Zm31.665 0-.883 5.004h-20.369l-.373 2.117h16.4l-.883 5.004h-16.399l-.374 2.117h20.369l-.882 5.004h-26.664l3.394-19.246h26.664Zm297.226 5.004h-22.574l-1.629 9.238h22.574l-.882 5.004h-28.789l3.393-19.246h28.789l-.882 5.004Zm-624.428-4.972-1.041 5.902h-6.295l.164-.93H513.55l-.373 2.117h22.654l-2.138 12.125h-28.869l1.046-5.934h6.215l-.164.93h16.359l.374-2.117H506.08l2.138-12.125 28.863.032Zm4.995 0 28.875-.032-3.394 19.246h-28.869l3.388-19.214Zm475.486 16.487-8.417-3.656-.939 5.324h13.232c-.373-.16-1.004-.449-1.864-.802a47.88 47.88 0 0 1-2.012-.866Zm-470.148-11.515-1.629 9.238h16.359l1.629-9.238h-16.359Zm-113.497 3.721h16.36l.656-3.721h-16.36l-.656 3.721Zm670.492 0h16.359l.656-3.721h-16.359l-.656 3.721Zm-624.706-3.753-.633 3.592h16.359l.634-3.592h-16.36Zm394.917 0-.633 3.592h16.359l.633-3.592H874.62Zm191.976-97.458-12.067 68.432h-34.964l12.726-72.174 28.3-24.058h108.036l-4.902 27.8h-97.129ZM241.045 91.967h-.016l-4.462 25.306h-34.515l12.726-72.174 28.3-24.058h120.289l-16.969 96.232h-34.98l4.462-25.306h-68.436l4.902-27.8h68.436l2.734-15.504h-74.852l-2.734 15.504h.016l-4.901 27.8Zm657.13 0h-.016l-4.462 25.306h-34.515l12.726-72.174 28.3-24.058h120.289l-16.969 96.232h-34.98l4.462-25.306h-68.436l4.902-27.8h68.436l2.734-15.504h-74.852l-2.734 15.504h.016l-4.901 27.8Zm-38.073-70.926-8.067 45.798-28.308 24.058h-10.682l15.108 16.93-1.652 9.445h-35.653l-23.032-26.375-29.864.115-4.635 26.26h-34.515l9.543-54.175h109.383l2.502-14.256H585.442l-7.153 40.63h109.367l-4.892 27.801H538.85l12.735-72.173 28.292-24.058h280.225ZM106.659 56.859l63.274-51.858h35.864l-19.796 112.27H151.25l12.349-70.035-64.545 52.749-46.197-52.571-12.318 69.857H6.012L25.808 5.001H61.45l45.209 51.858ZM492.55 90.54l12.255-69.501h34.973l-16.968 96.232h-52.126l-61.415-69.857-12.318 69.857h-34.527l16.968-96.232h52.571L492.55 90.54Zm684.093-69.501h144.347l-4.902 27.8h-54.798l-12.067 68.432h-34.75l12.066-68.432h-54.798l4.902-27.8Zm-106.351 43.128h59.038l-4.901 27.8h-59.038l4.901-27.8Z" />
						</svg>
					</a>
					
				 {if $page.page_name == 'index'}
					</h1>
				 {/if}
				</div>
				{if $page.page_name != 'checkout'}
					{hook h='displayNav2'}
				{/if}		
			</div>
		</div>
  </nav>
{/block}

{if $page.page_name != 'checkout'}
	<div class="full-header">
		<div class="container">
			<div class="position-static flex">
				{hook h='displayTop'}
			</div>
			{hook h='displayNavFullWidth'}
		  </div>
	</div>
{/if}	

{block name='header_top'}
	<div class="header-top">
		{if $page.page_name != 'checkout'}
			<div class="container">
				<div class="hidden-md-up text-sm-center mobile">
						<div id="mobile_menu" class="flex">
							<div class="float-xs-left" id="menu-icon">
								<i class="material-icons">menu</i>
							</div>
							<div class="float-xs-right order-10" id="_mobile_cart"></div>
							<div class="float-xs-right order-5" id="_mobile_user_info"></div>
							<div class="float-xs-right flex flex-no-wrap tablet-wide:flex-wrap flex-auto">
								{hook h='displayNav1' mod='ps_currencyselector'}
								{hook h='displayNav1' mod='ps_languageselector'}
							</div>
						</div>
						<div class="clearfix"></div>
					 </div>
					<div class="clearfix"></div>
					<div id="mobile_top_menu_wrapper" class="row hidden-md-up" style="display:none;">
						<div class="js-top-menu mobile" id="_mobile_top_menu"></div>
						
				  </div>
			</div>
		{/if}	
	</div>
{/block}
