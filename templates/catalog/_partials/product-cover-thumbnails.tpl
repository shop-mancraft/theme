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
<div class="images-container overflow-hidden row tablet:!mx-0">
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
    <div class="swiper" data-product-img-swiper data-gallery-expanded="true">
      <div class="swiper-wrapper">
        {foreach from=$product.images item=image}
          <div class="swiper-slide tablet:!w-[calc(50%_-_5px)] tablet:rounded-[5px] tablet:overflow-hidden">
            <img class="w-full" data-image-large-src="{$image.bySize.large_default.url}"
              src="{$image.bySize.home_default.url}" alt="{$image.legend}" title="{$image.legend}">
          </div>
        {/foreach}
      </div>
      <div class="swiper-pagination tablet:!hidden !text-left"></div>
      {if $product.images|@count > 4}
        <div class="hidden tablet:block mt-9">
          <button class="text-base text-white border-b-2 hover:border-main hover:text-main transition duration-200 pb-4"
            data-toggle-expand>
            <span class="text-expand">
              {l s='Show all images' d='Shop.Theme.Catalog'}
            </span>
            <span class="text-collapse">
              {l s='Show less images' d='Shop.Theme.Catalog'}
            </span>
          </button>
        </div>
      {/if}
    </div>
  {/block}



</div>
{hook h='displayAfterProductThumbs'}