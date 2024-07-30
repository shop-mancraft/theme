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
<div class="images-container overflow-hidden row tablet:!mx-0 tablet:mb-10 desktop:mb-[60px]">
  {* {block name='product_cover'}
      <div class="product-cover">

    {if $product.cover}

      {hook h='displayProductStickers'}
            <img class="js-qv-product-cover" src="{$product.default_image.bySize.medium_default.url}"
              alt="{$product.default_image.legend}" title="{$product.default_image.legend}" style="width:100%;"
              itemprop="image">
            <div class="layer hidden-sm-down" data-toggle="modal" data-target="#product-modal">
              <i class="material-icons zoom-in">&#xE8FF;</i>
            </div>

    {else}
            <img class="js-qv-product-cover" src="{$urls.no_picture_image.bySize.home_default.url}" style="width:100%;"
              itemprop="image">

    {/if}
      </div>

  {/block} *}

  {block name='product_images'}
    <div class="swiper relative group tablet:rounded-[5px] tablet:overflow-hidden" data-product-img-swiper>
      <div class="swiper-wrapper">
        {foreach from=$product.images item=image}
          <div class="swiper-slide tablet:rounded-[5px] overflow-hidden cursor-pointer">
            {$image|@print_r}
            <img class="w-full" data-image-large-src="{$image.bySize.large_default.url|replace:'-large_default':''}"
              src="{$image.bySize.large_default.url}" alt="{$image.legend}" title="{$image.legend}">
          </div>
        {/foreach}
      </div>
      <div class="right-5" data-product-img-next>
        <svg class="fill-white w-[50px] transition duration-200" xmlns="http://www.w3.org/2000/svg"
          viewBox="-12 -11 47 47">
          <path d="M10 6 8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path>
        </svg>
      </div>
      <div class="left-5" data-product-img-prev>
        <svg class="fill-white w-[50px] rotate-180 transition duration-200" xmlns="http://www.w3.org/2000/svg"
          viewBox="-12 -11 47 47">
          <path d="M10 6 8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path>
        </svg>
      </div>
      <div
        class="swiper-pagination !text-left !left-[15px] tablet:!left-5 tablet:!bottom-4 desktop:!left-[30px] desktop:!bottom-7 !w-auto right-1 tablet:right-[70px] desktop:right-20">
      </div>
      <div class="image-zoom-icon">
        <svg class="stroke-[#828282] group-hover:stroke-main transition duration-200" xmlns="http://www.w3.org/2000/svg"
          width="50" height="50" viewBox="0 0 50 50" fill="none">
          <path opacity="0.5"
            d="M43.7504 43.7499L34.7025 34.702M34.7025 34.702C36.2502 33.1543 37.4779 31.317 38.3155 29.2948C39.1531 27.2727 39.5842 25.1054 39.5842 22.9166C39.5842 20.7279 39.1531 18.5605 38.3155 16.5384C37.4779 14.5162 36.2502 12.6789 34.7025 11.1312C33.1548 9.58351 31.3175 8.35582 29.2953 7.51822C27.2732 6.68062 25.1058 6.24951 22.9171 6.24951C20.7283 6.24951 18.561 6.68062 16.5389 7.51822C14.5167 8.35582 12.6794 9.58351 11.1317 11.1312C8.00599 14.2569 6.25 18.4962 6.25 22.9166C6.25 27.337 8.00599 31.5763 11.1317 34.702C14.2574 37.8277 18.4967 39.5837 22.9171 39.5837C27.3375 39.5837 31.5768 37.8277 34.7025 34.702ZM22.9171 16.6666V29.1666M16.6671 22.9166H29.1671"
            stroke-linecap="round" stroke-linejoin="round" />
        </svg>
      </div>
    </div>
  {/block}

</div>
{hook h='displayAfterProductThumbs'}