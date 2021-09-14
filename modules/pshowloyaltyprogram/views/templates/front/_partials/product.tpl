{block name='product_miniature_item'}
    <article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
        <div class="thumbnail-container">
            {block name='product_thumbnail'}
                {if $product.cover}
                    <span class="thumbnail product-thumbnail">
                        <img
                                src="{$product.cover.bySize.home_default.url}"
                                alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
                                data-full-size-image-url="{$product.cover.large.url}"
                                width="300" 
                                height="300"
                        />
                    </span>
                {else}
                    <span class="thumbnail product-thumbnail">
                        <img src="{$urls.no_picture_image.bySize.home_default.url}" width="300" height="300" />
                    </span>
                {/if}
            {/block}

            <div class="product-description">
                {block name='product_name'}
                    <h2 class="h3 product-title" itemprop="name"><span>{$product.name}</span></h2>
                {/block}

                {block name='product_variants'}
                    <small class="flex flex-col float-left mb-4 align-center w-full">
                        {foreach from=$product.attributes item=attribute}
                            <span>
                                {$attribute.group}: {$attribute.name}
                            </span>
                        {/foreach}
                    </small>
                {/block}

                {block name='product_price_and_shipping'}
                    <div class="product-price-and-shipping">
                        <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
                        <span itemprop="price" class="price">{$product.points_price} {l s='Points' mod='pshowloyaltyprogram'}</span>
                        <div>
                            <button data-id_product="{$product.id_exchange_product}" data-id-product-attribute="{$product.id_product_attribute}" class="btn btn-primary exchangeButton" type="button">{l s='Exchange' mod='pshowloyaltyprogram'}</button>
                        </div>
                    </div>
                {/block}

                {block name='product_reviews'}
                    {hook h='displayProductListReviews' product=$product}
                {/block}
            </div>

            {block name='product_flags'}
                <ul class="product-flags">
                    {foreach from=$product.flags item=flag}
                        <li class="product-flag {$flag.type}">{$flag.label}</li>
                    {/foreach}
                </ul>
            {/block}

            <div class="highlighted-informations{if !$product.main_variants} no-variants{/if} hidden-sm-down">
                {block name='quick_view'}
                    <div class="product-price-and-shipping">
                        <span>{l s='Price' d='Shop.Theme.Catalog'}:</span>
                        <span itemprop="price" class="price">{$product.price}</span>
                    </div>
                {/block}

                {block name='product_variants'}
                    <small>
                        {foreach from=$product.attributes item=attribute}
                            {$attribute.group}: {$attribute.name},
                        {/foreach}
                    </small>
                {/block}
            </div>
        </div>
    </article>
{/block}
