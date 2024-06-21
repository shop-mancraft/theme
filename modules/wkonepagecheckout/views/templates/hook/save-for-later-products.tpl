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

<div class="card cart-container" style="margin-top: 10px;">
    <div class="card-block">
        <h1 class="h1">{l s='My Saved Cart' mod='wkonepagecheckout'}</h1>
    </div>
    <hr class="separator">
    <div class="" style="padding: 1rem;">
        <ul class="cart-items">
            {foreach $savedCart as $key => $cart}
                <li class="cart-item">
                    <div class="product-line-grid">
                        <div class="product-line-grid-left col-md-3 col-xs-4">
                            <span class="product-image media-middle">
                                <img src="{$cart.product_image_link}" alt="{$cart.product_name}" loading="lazy">
                            </span>
                        </div>

                        <!--  product line body: label, discounts, price, attributes, customizations -->
                        <div class="product-line-grid-body col-md-3 col-xs-8">
                            <div class="product-line-info">
                                <a class="label" href="{if isset($cart.product_link)}{$cart.product_link}{/if}"
                                    data-id_customization="0">{$cart.product_name}</a>
                            </div>


                            </a>
                            <br>
                            {if isset($cart.attribute_name)}
                                {foreach $cart.attribute_name as $attribute }
                                    {$attribute} <br>
                                {/foreach}
                            {else}
                                {l s='Default' mod='wkonepagecheckout'}
                            {/if}

                        </div>

                        <!--  product line right content: actions (quantity, delete), price -->
                        <div class="product-line-grid-right product-line-actions col-md-6 col-xs-12">
                            <div class="row">
                                <div class="col-xs-4 hidden-md-up"></div>
                                <div class="col-md-10 col-xs-6">
                                    <div class="row">
                                        <div class="col-md-6 col-xs-6 qty">
                                            <strong>Qty: </strong>{$cart.quantity}
                                            <br>
                                            <strong>In Stock: </strong>{$cart.available_qty}
                                        </div>
                                        <div class="col-md-6 col-xs-2 price">
                                            <span class="product-price">
                                                <strong>
                                                    {if $cart.product_price}{$cart.product_price}{else}--{/if}
                                                </strong>
                                                <br>
                                                {if isset($showTax)}
                                                    {l s='(tax incl.)' mod='wkonepagecheckout'}
                                                {else}
                                                    {l s='(tax excl.)' mod='wkonepagecheckout'}
                                                {/if}
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md- col-xs-2 cart-line-product-actions text-right">
                                    {if $cart.available_for_order > 0}
                                        <a title="{l s='Add to cart' mod='wkonepagecheckout'}" href="javascript:void(0);"
                                            class="wk-add-into-cart" data-quantity="{$cart.quantity}"
                                            data-id-product="{$cart.id_product}"
                                            data-id-product-attribute="{$cart.id_product_attribute}" style="color: #232323;"
                                            data-id-customization="{$cart.id_customization}" style="color: #232323;">
                                            <i class="material-icons shopping-cart"></i>
                                        </a>
                                    {/if}

                                    <a title="{l s='Delete' mod='wkonepagecheckout'}" href="javascript:void(0);"
                                            class="wk-delete-from-saved-cart" data-quantity="{$cart.quantity}"
                                            data-saved-cart-id ="{$cart.id}"
                                            data-id-product="{$cart.id_product}"
                                            data-id-product-attribute="{$cart.id_product_attribute}" style="color: #232323;"
                                            data-id-customization="{$cart.id_customization}" style="color: #232323;">
                                            <i class="material-icons">delete</i>
                                        </a>
                                </div>
                            </div>
                        </div>

                        <div class="clearfix"></div>
                    </div>

                </li>
            {/foreach}
        </ul>
    </div>
</div>