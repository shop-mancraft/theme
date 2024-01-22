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

 {assign var=imagesCount value=$product.images|count}

 <div data-product-modal class="js-product-images-modal">
   <div class="flex justify-between items-start grow-0 bg-black/50">
     <span class="p-5 text-white text-base tablet:text-lg" data-slides-count="{$imagesCount}">
       1/{$imagesCount}
     </span>
     <button class="group" data-modal-close>
       <svg class="w-10 fill-white group-hover:fill-gray-light transition duration-200 bg-gray-normal"
         xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
         <path
           d="M12 10.6L6.6 5.2 5.2 6.6l5.4 5.4-5.4 5.4 1.4 1.4 5.4-5.4 5.4 5.4 1.4-1.4-5.4-5.4 5.4-5.4-1.4-1.4-5.4 5.4z">
         </path>
       </svg>
     </button>
   </div>
   <div class="group swiper !h-[calc(100%_-_148px)] tablet:!h-[calc(100%_-_188px)] flex-1" data-product-modal-swiper>
     <div class="swiper-wrapper">
       {foreach from=$product.images item=image}
         <div class="swiper-slide flex items-center justify-center py-5 tablet:p-5 tablet:p-10 desktop:px-20 bg-black/50">
           <img class="object-contain max-h-full" loading="lazy" src="{$image.bySize.large_default.url}"
             alt="{$image.legend}" title="{$image.legend}" itemprop="image">
         </div>
       {/foreach}
     </div>
     <div class="right-5" data-modal-slider-next>
       <svg class="fill-white w-[50px] transition duration-200" xmlns="http://www.w3.org/2000/svg"
         viewBox="-12 -11 47 47">
         <path d="M10 6 8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path>
       </svg>
     </div>
     <div class="left-5" data-modal-slider-prev>
       <svg class="fill-white w-[50px] rotate-180 transition duration-200" xmlns="http://www.w3.org/2000/svg"
         viewBox="-12 -11 47 47">
         <path d="M10 6 8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path>
       </svg>
     </div>
   </div>
   <div class="swiper grow-0 h-20 tablet:h-[120px] p-2 overflow-hidden" data-modal-thumbnails-swiper>
     <div class="swiper-wrapper">
       {foreach from=$product.images item=image}
         <div
           class="swiper-slide !w-auto mr-2 relative cursor-pointer before:opacity-0 before:transition before:duration-200">
           <img class="h-full object-cover" loading="lazy" src="{$image.bySize.cart_default.url}" alt="{$image.legend}"
             title="{$image.legend}">
         </div>
       {/foreach}
     </div>
   </div>
</div>