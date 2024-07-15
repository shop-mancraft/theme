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

<div class="overflow-hidden mb-10 tablet:mb-20"> 
	<div class="container relative">
		<h3 class="h1 tt-title mb-8 min-[543px]:text-center">{l s='Recommended Categories' d='Modules.Ttcategoryslider.Title'}</h3>
		<p class="inline-block mb-3 text-left w-full">{l s='Recommended Categories description' d='Modules.Ttcategoryslider.Description'}</p>
		<div class="customNavigation tablet-narrow:hidden !right-[15px]">
			<a class="btn prev categories-swiper-prev">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="width: 22px;margin: 3px 2px;">
				<path d="M15.41 16.59 10.83 12l4.58-4.59L14 6l-6 6 6 6 1.41-1.41z" fill="#fff"></path>
				</svg>
			</a>
			<a class="btn next categories-swiper-next">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="width: 22px;margin: 3px 2px;">
				<path d="M8.59 16.59 13.17 12 8.59 7.41 10 6l6 6-6 6-1.41-1.41z" fill="#fff"></path>
				</svg>
			</a>
		</div>
		<div class="mx-[-10px] pr-[25%] phablet:pr-0" data-categories-swiper>
			<div class="swiper-wrapper flex flex-wrap">
				{foreach from=$ttcategorysliderinfos item=ttcategorysliderinfo}

					{if $ttcategorysliderinfo.id == 49 ||
						$ttcategorysliderinfo.id == 11}
						{assign var="tagline" value="Top Quality" }
					{elseif $ttcategorysliderinfo.id == 52}
						{assign var="tagline" value="Highest Quality" }
					{elseif $ttcategorysliderinfo.id == 48}
						{assign var="tagline" value="Super durable" }
					{elseif $ttcategorysliderinfo.id == 50}
						{assign var="tagline" value="Mancraft" }
					{else}
						{assign var="tagline" value="" }
					{/if}

					<div class="swiper-slide p-2.5">
						<a href="{$link->getCategoryLink($ttcategorysliderinfo.id)}" class="relative p-3 tablet:p-5 w-full aspect-[4/3] border-[#313131] hover:border-main transition duration-300 border border-solid rounded-[5px] group w-full h-full flex items-end justify-between overflow-hidden">
							<div class="relative z-20 mr-5 tablet:max-w-[75%]">
								{if isset($tagline) && $tagline}
									<p class="text-main text-base text-left uppercase before:content-[''] before:bg-main before:h-0.5 before:w-4 before:inline-block before:mb-1 before:mr-2">
										{$tagline}
									</p>
								{/if}
								<h3 class="font-semibold text-white text-lg tablet:text-[22px] text-left group-hover:underline">{$ttcategorysliderinfo.name}</h3>
							</div>
							<span class="relative z-20 rounded-full border border-solid border-white bg-transparent group-hover:bg-main group-hover:border-main transition duration-300">
								<svg class="fill-white group-hover:fill-black w-8 tablet:w-[50px]" xmlns="http://www.w3.org/2000/svg" viewBox="-12 -11 47 47">
									<path d="M10 6 8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path>
								</svg>
							</span>
							{if isset($ttcategorysliderinfo.cate_id) && $ttcategorysliderinfo.cate_id}
								<div class="absolute inset-0 z-10">
									<img class="w-full h-full object-cover group-hover:scale-110 duration-700 transition-all" src="{$image_url}/{$ttcategorysliderinfo.cate_id.image}">
								</div>
							{/if}
						</a>
					</div>
				{/foreach}
			</div>
		</div>
		<div class=" mt-5 tablet:mt-10 flex justify-center flex-wrap" style="gap: 20px;">
			<a href="/{$language.iso_code}/cms/b2b-mancraft" class="font-semibold group flex items-center text-white text-lg p-4 py-3 border border-white rounded-full hover:text-white hover:bg-main hover:border-main ">
				{l s='Go to B2B zone' mod='ttcategoryslider'}
			</a>
			<a href="/{$language.iso_code}/cms/mancraft-brand-ambassador-program" class="font-semibold group flex items-center text-white text-lg p-4 py-3 border border-white rounded-full hover:text-white hover:bg-main hover:border-main tablet:hidden">
				{l s='Ambassador program' mod='ttcategoryslider'}
			</a>
		</div>
	</div>
</div>