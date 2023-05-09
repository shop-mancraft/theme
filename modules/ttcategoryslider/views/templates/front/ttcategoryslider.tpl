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
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2020 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<divclass="overflow-hidden">
	<div class="container">
		<h3 class="h1 tt-title">
			{l s='Recommended Categories' mod='ttcategoryslider'}</h3>
		<div data-categories-swiper>
			<div class="swiper-wrapper">
				{foreach from=$ttcategorysliderinfos item=ttcategorysliderinfo}
					<div class="swiper-slide p-5">
						<div class="p-5 w-full aspect-[4/3] border-main border-[3px] border-solid rounded-[5px] ">
							<a href="{$link->getCategoryLink($ttcategorysliderinfo.id)}" class="group w-full h-full flex items-end">
								<div class="mr-5 tablet:max-w-[50%]">
								{*  *}
									<h3 class=" text-white text-lg tablet:text-[22px]">{$ttcategorysliderinfo.name}</h3>
								</div>
								<span class="rounded-full border border-solid border-white bg-transparent group-hover:bg-white transition duration-300">
									<svg class="fill-white group-hover:fill-black" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 40 40">
										<path d="M10 6 8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path>
									</svg>
								</span>
							</a>
						</div>
					</div>
				{/foreach}
			</div>
		</div>
	</div>
</div>