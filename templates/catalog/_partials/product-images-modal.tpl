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

 <div data-product-modal>
   <div class="flex justify-between grow-0 p-5">
     <span class="p-2" data-slides-count><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
         <path
           d="M12 10.6L6.6 5.2 5.2 6.6l5.4 5.4-5.4 5.4 1.4 1.4 5.4-5.4 5.4 5.4 1.4-1.4-5.4-5.4 5.4-5.4-1.4-1.4-5.4 5.4z">
         </path>
       </svg></span>
     <button class="p-2" data-modal-close> </button>
   </div>
   <div class="swiper flex-1 py-5" data-product-modal-swiper>
     <div class="swiper-wrapper">
       {foreach from=$product.images item=image}
         <div class="swiper-slide px-5 tablet:px-10 desktop:px-20 bg-black/50">
           <img class="object-contain" loading="lazy" src="{$image.bySize.large_default.url}" alt="{$image.legend}"
             title="{$image.legend}" itemprop="image">
         </div>
       {/foreach}
     </div>
   </div>
   <div class="swiper grow-0 h-12 tablet:h-[100px] p-2 overflow-hidden" data-modal-thumbnails-swiper>
     <div class="swiper-wrapper">
       {foreach from=$product.images item=image}
         <div class="swiper-slide pr-2">
           <img class="object-contain" loading="lazy" src="{$image.bySize.cart_default.url}" alt="{$image.legend}"
             title="{$image.legend}">
         </div>
       {/foreach}
     </div>
   </div>
</div>