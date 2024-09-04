{**
 * 2007-2020 PrestaShop and Contributors
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
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{if $product.show_price}
  <div class="product-prices">
    <div class="flex items-center mb-5 flex-wrap">
      {block name='product_availability'}
        <div id="product-availability" class="flex items-center pr-2 mr-2 border-r border-[#64635D]">
          {if $product.show_availability && $product.availability_message}
            <span class="mr-1 w-3 h-3 rounded-full block shrink-0" style="background-color:
              {if $product.availability == 'available'}
                #7CFC00
              {elseif $product.availability == 'last_remaining_items'}
                #FF9A52
              {else}
                #FF0000
              {/if}
            ;">
            </span>
            <span class="text-white !text-sm">
              {$product.availability_message}
            </span>
          {/if}
        </div>
      {/block}

      <div class="product-reference pr-2 mr-2 border-r border-[#64635D] shrink-0 ">
        <label class=" !text-main">{l s='ean13:' d='Shop.Theme.Catalog'} </label>
        <span itemprop="ean" class="text-[#BDBDBD] !text-sm">
          {if !empty($product.ean13)}
            {$product.ean13}
          {else}
            {foreach from=$groups key=id_attribute_group item=group}
              {foreach from=$group.attributes key=id_attribute item=group_attribute}
                {if !empty($group.attributes)}
                  {if $group_attribute.selected}

                    {foreach from=$attributesCombinations item=attributeCombination}
                      {if $attributeCombination.id_attribute == $id_attribute}
                        {$attributeCombination.ean13}
                        {break}{break}{break}
                      {/if}
                    {/foreach}

                  {/if}
                {/if}
              {/foreach}
            {/foreach}
          {/if}
        </span>
      </div>

      {block name='product_reference'}
        {if isset($product.reference_to_display) && $product.reference_to_display neq ''}
          <div class="product-reference pr-2 mr-2 shrink-0 ">
            <label class="text-[#BDBDBD]">{l s='SKU:' d='Shop.Theme.Catalog'} </label>
            <span itemprop="sku" class="text-[#BDBDBD]">{$product.reference_to_display}</span>
          </div>
        {/if}
      {/block}

    </div>

    {block name='product_discount'}
      {if $product.has_discount}
        <div class="product-discount">
          {hook h='displayProductPriceBlock' product=$product type="old_price"}
          <span class="regular-price">{$product.regular_price}</span>
          {if $product.discount_type === 'percentage'}
            <span
              class="discount discount-percentage !inline-block text-[#FF0000]">{l s='Save %percentage%' d='Shop.Theme.Catalog' sprintf=['%percentage%' => $product.discount_percentage_absolute]}</span>
          {else}
            <span class="discount discount-amount !inline-block text-[#FF0000]">
              {l s='Save %amount%' d='Shop.Theme.Catalog' sprintf=['%amount%' => $product.discount_to_display]}
            </span>
          {/if}
        </div>
      {/if}
    {/block}

    {block name='product_price'}
      <div class="product-price h5 {if $product.has_discount}has-discount{/if}" itemprop="offers" itemscope
        itemtype="https://schema.org/Offer">
        <link itemprop="availability" href="{$product.seo_availability}" />
        <meta itemprop="priceCurrency" content="{$currency.iso_code}">

        <div class="current-price flex items-end mb-5 font-normal">
          <span itemprop="price" class="leading-none text-3xl !text-main font-normal"
            content="{$product.price_amount}">{$product.price}</span>

          <div class="tax-shipping-delivery-label ml-2.5 !text-[#64635D] !text-sm">
            {if !$configuration.taxes_enabled}
              {l s='No tax' d='Shop.Theme.Catalog'}
            {elseif $configuration.display_taxes_label}
              {$product.labels.tax_long}
            {/if}
            {hook h='displayProductPriceBlock' product=$product type="price"}
            {hook h='displayProductPriceBlock' product=$product type="after_price"}
            {if $product.additional_delivery_times == 1}
              {if $product.delivery_information}
                <span class="delivery-information">{$product.delivery_information}</span>
              {/if}
            {elseif $product.additional_delivery_times == 2}
              {if $product.quantity > 0}
                <span class="delivery-information">{$product.delivery_in_stock}</span>
                {* Out of stock message should not be displayed if customer can't order the product. *}
              {elseif $product.quantity <= 0 && $product.add_to_cart_url}
                <span class="delivery-information">{$product.delivery_out_stock}</span>
              {/if}
            {/if}
          </div>

        </div>

        {block name='product_unit_price'}
          {if $displayUnitPrice}
            <p class="product-unit-price sub">
              {l s='(%unit_price%)' d='Shop.Theme.Catalog' sprintf=['%unit_price%' => $product.unit_price_full]}</p>
          {/if}
        {/block}
      </div>
    {/block}

    {block name='product_without_taxes'}
      {if $priceDisplay == 2}
        <p class="product-without-taxes">
          {l s='%price% tax excl.' d='Shop.Theme.Catalog' sprintf=['%price%' => $product.price_tax_exc]}</p>
      {/if}
    {/block}

    {block name='product_pack_price'}
      {if $displayPackPrice}
        <p class="product-pack-price">
          <span>{l s='Instead of %price%' d='Shop.Theme.Catalog' sprintf=['%price%' => $noPackPrice]}</span>
        </p>
      {/if}
    {/block}

    {block name='product_ecotax'}
      {if $product.ecotax.amount > 0}
        <p class="price-ecotax">
          {l s='Including %amount% for ecotax' d='Shop.Theme.Catalog' sprintf=['%amount%' => $product.ecotax.value]}
          {if $product.has_discount}
            {l s='(not impacted by the discount)' d='Shop.Theme.Catalog'}
          {/if}
        </p>
      {/if}
    {/block}

    {hook h='displayProductPriceBlock' product=$product type="weight" hook_origin='product_sheet'}

  </div>
{/if}