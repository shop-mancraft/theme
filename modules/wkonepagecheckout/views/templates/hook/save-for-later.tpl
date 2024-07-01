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

{if Configuration::get('WK_CHECKOUT_CART_SAVE_LATER') && $customer.is_logged && $customer.is_guest !== "1"}
    <a title="{l s='Save for later' mod='wkonepagecheckout'}"
        data-id-product-attribute="{$product.id_product_attribute}"
        data-id-product="{$product.id_product}" data-quantity="{$product.cart_quantity}"
        data-id-customization="{if isset($product.id_customization)}{$product.id_customization}{else}0{/if}"
        href="javascript:void(0);" class="remove-from-cart wk-cart-save wk-left">
        <i class="material-icons">&#xE8B5;</i>
    </a>
{/if}