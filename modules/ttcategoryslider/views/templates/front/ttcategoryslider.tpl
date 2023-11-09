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
								<h3 class=" text-white text-lg tablet:text-[22px] text-left group-hover:underline">{$ttcategorysliderinfo.name}</h3>
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
			<a href="/{$language.iso_code}/cms/b2b-mancraft-client" class="group flex items-center text-white text-lg p-4 py-3 border border-white rounded-full hover:text-white hover:bg-main hover:border-main ">
				<svg class="mr-2 block fill-main group-hover:fill-white" width="28" height="35" viewBox="0 0 28 35" fill="none" xmlns="http://www.w3.org/2000/svg">
					<path fill-rule="evenodd" clip-rule="evenodd" d="M2.33015 28.9323C1.04857 28.9323 0 27.8837 0 26.6021V12.2137C0 10.9322 1.04857 9.88359 2.33015 9.88359H4.66031V8.33015C4.66031 7.04857 5.70888 6 6.99046 6H21.0095C22.2911 6 23.3397 7.04857 23.3397 8.33015V9.88359H25.6698C26.9514 9.88359 28 10.9322 28 12.2137V26.6021C28 27.8837 26.9514 28.9323 25.6698 28.9323H2.33015ZM25.6698 27.3788C26.097 27.3788 26.4466 27.0293 26.4466 26.6021V16.0197C25.4757 17.0294 24.0776 17.6508 22.563 17.6508H17.0978V19.2042C17.0978 20.4858 16.0492 21.5344 14.7676 21.5344H13.2324C11.9508 21.5344 10.9022 20.4858 10.9022 19.2042V17.6508H5.43703C3.92243 17.6508 2.52433 17.0294 1.55344 16.0197V26.6021C1.55344 27.0293 1.90296 27.3788 2.33015 27.3788H25.6698ZM15.5443 17.6508V19.2042C15.5443 19.6314 15.1948 19.9809 14.7676 19.9809H13.2324C12.8052 19.9809 12.4557 19.6314 12.4557 19.2042V17.6508H15.5443ZM2.33015 11.437H25.6698C26.097 11.437 26.4466 11.7866 26.4466 12.2137C26.4466 14.3497 24.6989 16.0973 22.563 16.0973H5.43703C3.30105 16.0973 1.55344 14.3497 1.55344 12.2137C1.55344 11.7866 1.90296 11.437 2.33015 11.437ZM6.21375 8.33015C6.21375 7.90296 6.56327 7.55344 6.99046 7.55344H21.0095C21.4367 7.55344 21.7863 7.90296 21.7863 8.33015V9.88359H6.21375V8.33015Z"></path>
				</svg>
				{l s='Go to B2B zone' mod='ttcategoryslider'}
			</a>
			<a href="/{$language.iso_code}/cms/mancraft-brand-ambassador-program" class="group flex items-center text-white text-lg p-4 py-3 border border-white rounded-full hover:text-white hover:bg-main hover:border-main ">
				<svg class="mr-2 block fill-main group-hover:fill-white" width="35" height="35" viewBox="0 0 35 35" fill="none" xmlns="http://www.w3.org/2000/svg">
					<path d="M19.25 11.9385H18.55V8.98097C18.5523 8.59831 18.45 8.2223 18.2541 7.89356C18.0583 7.56482 17.7763 7.29584 17.4387 7.11569C17.1011 6.93553 16.7207 6.85105 16.3385 6.87137C15.9564 6.89169 15.5871 7.01603 15.2705 7.23097L7.8435 12.2885H3.85C3.29305 12.2885 2.7589 12.5097 2.36508 12.9035C1.97125 13.2974 1.75 13.8315 1.75 14.3885V20.6885C1.75 21.2454 1.97125 21.7796 2.36508 22.1734C2.7589 22.5672 3.29305 22.7885 3.85 22.7885H8.05C8.12255 22.7879 8.19458 22.7761 8.2635 22.7535L15.2285 27.727C15.5424 27.9515 15.9121 28.0851 16.297 28.1132C16.6819 28.1413 17.0671 28.0628 17.4103 27.8863C17.7535 27.7098 18.0415 27.4422 18.2425 27.1128C18.4436 26.7833 18.55 26.4049 18.55 26.019V23.1385H19.25C19.807 23.1385 20.3411 22.9172 20.7349 22.5234C21.1287 22.1296 21.35 21.5954 21.35 21.0385V14.0385C21.35 13.4815 21.1287 12.9474 20.7349 12.5535C20.3411 12.1597 19.807 11.9385 19.25 11.9385ZM3.15 20.6885V14.3885C3.15 14.2028 3.22375 14.0248 3.35503 13.8935C3.4863 13.7622 3.66435 13.6885 3.85 13.6885H4.55V16.4885C4.55 16.6741 4.62375 16.8522 4.75503 16.9834C4.8863 17.1147 5.06435 17.1885 5.25 17.1885C5.43565 17.1885 5.6137 17.1147 5.74497 16.9834C5.87625 16.8522 5.95 16.6741 5.95 16.4885V13.6885H7.35V21.3885H3.85C3.66435 21.3885 3.4863 21.3147 3.35503 21.1834C3.22375 21.0522 3.15 20.8741 3.15 20.6885ZM17.15 26.019C17.1511 26.1473 17.1169 26.2734 17.0511 26.3836C16.9854 26.4937 16.8906 26.5837 16.7772 26.6437C16.6638 26.7036 16.536 26.7313 16.408 26.7236C16.2799 26.7159 16.1564 26.6731 16.051 26.6L15.757 26.39V16.1385C15.757 15.9528 15.6832 15.7748 15.552 15.6435C15.4207 15.5122 15.2427 15.4385 15.057 15.4385C14.8713 15.4385 14.6933 15.5122 14.562 15.6435C14.4307 15.7748 14.357 15.9528 14.357 16.1385V25.3785L8.75 21.378V13.3595L16.065 8.39997C16.1703 8.33064 16.2923 8.29102 16.4183 8.2853C16.5442 8.27958 16.6693 8.30798 16.7805 8.36748C16.8916 8.42699 16.9846 8.51541 17.0496 8.62339C17.1147 8.73137 17.1494 8.85491 17.15 8.98097V26.019ZM19.95 21.0385C19.95 21.2241 19.8763 21.4022 19.745 21.5334C19.6137 21.6647 19.4357 21.7385 19.25 21.7385H18.55V13.3385H19.25C19.4357 13.3385 19.6137 13.4122 19.745 13.5435C19.8763 13.6748 19.95 13.8528 19.95 14.0385V21.0385Z"></path>
					<path d="M27.1565 14.7594C27.0441 14.5066 26.8831 14.2785 26.6825 14.0879C26.4819 13.8974 26.2458 13.7482 25.9876 13.6489C25.7294 13.5496 25.4541 13.5022 25.1776 13.5092C24.901 13.5163 24.6286 13.5778 24.3758 13.6902C24.123 13.8026 23.8948 13.9636 23.7042 14.1642C23.5137 14.3648 23.3645 14.6009 23.2652 14.8591C23.1659 15.1173 23.1185 15.3926 23.1256 15.6691C23.1327 15.9457 23.1941 16.2181 23.3065 16.4709C23.3965 16.6878 23.4429 16.9204 23.4429 17.1552C23.4429 17.39 23.3965 17.6225 23.3065 17.8394C23.135 18.2282 23.0841 18.6594 23.1602 19.0775C23.2363 19.4955 23.436 19.8811 23.7335 20.1844C23.9746 20.4265 24.271 20.6061 24.5972 20.7076C24.9233 20.8092 25.2693 20.8296 25.6052 20.7672C25.941 20.7048 26.2566 20.5614 26.5245 20.3495C26.7924 20.1375 27.0045 19.8634 27.1425 19.5509C27.4754 18.7965 27.6485 17.9813 27.6509 17.1567C27.6533 16.332 27.485 15.5158 27.1565 14.7594ZM25.872 18.9874C25.8282 19.0919 25.7587 19.1835 25.67 19.2539C25.5812 19.3242 25.4762 19.371 25.3645 19.3899C25.2523 19.4114 25.1366 19.4051 25.0273 19.3715C24.9181 19.338 24.8188 19.2782 24.738 19.1974C24.638 19.0904 24.5722 18.9559 24.5491 18.8112C24.526 18.6666 24.5467 18.5183 24.6085 18.3854C24.7699 17.9972 24.8529 17.5809 24.8529 17.1604C24.8529 16.74 24.7699 16.3237 24.6085 15.9354C24.5465 15.8032 24.5257 15.6554 24.5488 15.5113C24.5719 15.3671 24.6378 15.2332 24.738 15.1269C24.802 15.0609 24.8787 15.0085 24.9636 14.973C25.0484 14.9375 25.1396 14.9196 25.2315 14.9204C25.2758 14.9168 25.3203 14.9168 25.3645 14.9204C25.4753 14.9417 25.5793 14.9894 25.6676 15.0595C25.756 15.1295 25.8261 15.2199 25.872 15.3229C26.1261 15.9004 26.2572 16.5243 26.2572 17.1552C26.2572 17.786 26.1261 18.41 25.872 18.9874Z" ></path>
					<path d="M31.003 10.2969C30.8477 10.0531 30.6437 9.84397 30.4038 9.68264C30.1639 9.5213 29.8933 9.41124 29.6089 9.35933C29.3245 9.30742 29.0325 9.31478 28.7511 9.38096C28.4697 9.44714 28.205 9.57071 27.9735 9.74393C27.7421 9.91715 27.5489 10.1363 27.4061 10.3876C27.2632 10.639 27.1738 10.9171 27.1435 11.2046C27.1131 11.4921 27.1424 11.7827 27.2296 12.0583C27.3167 12.334 27.4598 12.5886 27.65 12.8064C28.5678 14.0707 29.062 15.5929 29.062 17.1552C29.062 18.7174 28.5678 20.2396 27.65 21.5039C27.4137 21.8149 27.2688 22.1856 27.2316 22.5745C27.1944 22.9633 27.2664 23.3548 27.4395 23.7049C27.6125 24.0551 27.8799 24.35 28.2114 24.5566C28.5428 24.7632 28.9254 24.8733 29.316 24.8744H29.4735C29.7773 24.8525 30.0727 24.7648 30.3392 24.6173C30.6058 24.4699 30.837 24.2662 31.017 24.0204C32.4714 22.0275 33.254 19.6235 33.2515 17.1564C33.2489 14.6892 32.4615 12.2868 31.003 10.2969ZM29.876 23.1804C29.8158 23.2643 29.7379 23.3338 29.6477 23.384C29.5576 23.4342 29.4574 23.4639 29.3545 23.4709C29.2546 23.4797 29.1541 23.466 29.0602 23.4309C28.9664 23.3957 28.8815 23.34 28.812 23.2679C28.6899 23.1456 28.6174 22.9826 28.6084 22.81C28.5993 22.6375 28.6544 22.4678 28.763 22.3334C29.8547 20.8282 30.4426 19.0164 30.4426 17.1569C30.4426 15.2975 29.8547 13.4856 28.763 11.9804C28.6534 11.8458 28.5977 11.6753 28.6068 11.502C28.6159 11.3286 28.689 11.1649 28.812 11.0424C28.9424 10.9131 29.1183 10.8402 29.302 10.8394H29.3545C29.4571 10.8478 29.5568 10.878 29.6467 10.9281C29.7367 10.9783 29.8148 11.0471 29.876 11.1299C31.155 12.8785 31.8443 14.9887 31.8443 17.1552C31.8443 19.3216 31.155 21.4318 29.876 23.1804Z" ></path>
				</svg>
				{l s='Ambassador program' mod='ttcategoryslider'}
			</a>
		</div>
	</div>
</div>