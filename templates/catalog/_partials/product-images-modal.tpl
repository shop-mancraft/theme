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
   <div class="flex justify-between items-start grow-0">
     <span class="p-5 pb-0 text-white text-base tablet:text-lg" data-slides-count="{$imagesCount}">
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
   <div class="group swiper z-50 !h-[calc(100%_-_148px)] flex-1" data-product-modal-swiper>
     <div class="swiper-wrapper">
       {foreach from=$product.images item=image}
         <div class="swiper-slide flex items-center justify-center pb-5 tablet:px-5 desktop:px-10">
           <div class="swiper-zoom-container w-full h-full">
             <img class="object-contain max-h-full h-full" loading="lazy" src="{$image.bySize.large_default.url}"
               alt="{$image.legend}" title="{$image.legend}" itemprop="image">
           </div>
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
   <div class="grow-0 px-5 flex items-center justify-center h-5 tablet:hidden text-white text-xs">
     <svg class="h-full mr-2 shrink-0 fill-white" xmlns="http://www.w3.org/2000/svg" viewBox="2 2 20 20">
       <path
         d="M12.356 4.507A1.5 1.5 0 0 0 11 6l-.001 7.292-1.645-1.646a1.914 1.914 0 1 0-2.708 2.708l4.793 4.793C12.765 20.472 13.892 21 15.5 21a4.5 4.5 0 0 0 4.5-4.5V12a1.5 1.5 0 0 0-1.5-1.5l-.144.007c-.143.013-.28.047-.41.097l-.006-.025A1.5 1.5 0 0 0 16.5 9.5l-.144.007c-.143.013-.28.047-.41.097l-.006-.025A1.5 1.5 0 0 0 14.5 8.5l-.144.007c-.096.009-.188.027-.277.053L14 8.586V6a1.5 1.5 0 0 0-1.5-1.5l-.144.007zm.144.993a.5.5 0 0 1 .5.5v5l.008.09a.5.5 0 0 0 .984 0L14 11v-1a.5.5 0 0 1 .992-.09L15 10v2l.008.09a.5.5 0 0 0 .984 0L16 12v-1a.5.5 0 0 1 .992-.09L17 11v2l.008.09a.5.5 0 0 0 .984 0L18 13v-1a.5.5 0 1 1 1 0v4.5a3.5 3.5 0 0 1-3.5 3.5c-1.325 0-2.206-.413-3.354-1.56l-4.792-4.794a.914.914 0 1 1 1.292-1.292l2.5 2.5A.5.5 0 0 0 12 14.5V6a.5.5 0 0 1 .5-.5zM8.5 4a.5.5 0 0 1 .492.41L9 4.5v2a.5.5 0 0 1-.992.09L8 6.5v-.794L4.706 9H5.5a.5.5 0 0 1 .492.41L6 9.5a.5.5 0 0 1-.41.492L5.5 10h-2a.5.5 0 0 1-.492-.41L3 9.5v-2a.5.5 0 0 1 .992-.09L4 7.5v.792L7.292 5H6.5a.5.5 0 0 1-.492-.41L6 4.5a.5.5 0 0 1 .41-.492L6.5 4h2z">
       </path>
     </svg>
     {l s='Zoom-in image by pinch gesture' d='Shop.Theme.Catalog'}
   </div>
   <div class="swiper grow-0 h-20 tablet:h-[100px] p-2 overflow-hidden" data-modal-thumbnails-swiper>
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