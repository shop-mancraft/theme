{**
* NOTICE OF LICENSE
*
* All rights reserved,
* Please go through LICENSE.txt file inside our module
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade this module to newer
* versions in the future. If you wish to customize this module for your
* needs please refer to CustomizationPolicy.txt file inside our module for more information.
*
*  @author    Webkul IN
*  @copyright since 2010 Webkul
*  @license   LICENSE.txt
*}
<div id="product-modal">
    <div class="modal fade js-product-images-modal" id="wk-product-modal-{$product.id_product}">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    {assign var=imagesCount value=$product.images|count}
                    <figure>
                        <img class="js-modal-product-cover-{$product.id_product} product-cover-modal" width="{$product.cover.large.width}" src="{$product.cover.large.url}" alt="{$product.cover.legend}" title="{$product.cover.legend}" itemprop="image">
                        <figcaption class="image-caption">
                            {block name='product_description_short'}
                                <div id="product-description-short" itemprop="description">{$product.description_short nofilter}</div>
                            {/block}
                        </figcaption>
                    </figure>
                    <aside id="thumbnails" class="thumbnails js-thumbnails text-xs-center">
                        {block name='product_images'}
                        <div class="js-modal-mask mask {if $imagesCount <= 5} nomargin {/if}">
                            <ul class="product-images js-modal-product-images">
                                {foreach from=$product.images item=image}
                                    <li class="thumb-container">
                                        <img data-id-product="{$product.id_product}" data-image-large-src="{$image.large.url}" class="thumb js-modal-thumb" src="{$image.medium.url}" alt="{$image.legend}" title="{$image.legend}" width="{$image.medium.width}" itemprop="image">
                                    </li>
                                {/foreach}
                            </ul>
                        </div>
                        {/block}
                        {if $imagesCount > 5}
                            <div class="arrows js-modal-arrows">
                                <i class="material-icons arrow-up js-modal-arrow-up">&#xE5C7;</i>
                                <i class="material-icons arrow-down js-modal-arrow-down">&#xE5C5;</i>
                            </div>
                        {/if}
                    </aside>
                </div>
            </div>
        </div>
    </div>
</div>
