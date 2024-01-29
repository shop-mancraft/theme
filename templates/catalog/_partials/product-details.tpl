{assign var='ASSEMBLY_LINK_FEATURE_ID' value=18}

<div id="product-details">
  {block name='product_reference'}
    {if isset($product_manufacturer->id)}
      <div class="product-manufacturer">
        {if isset($manufacturer_image_url)}
          <a href="{$product_brand_url}">
            <img src="{$manufacturer_image_url}" class="img img-thumbnail manufacturer-logo"
              alt="{$product_manufacturer->name}">
          </a>
        {else}
          <label class="label">{l s='Brand' d='Shop.Theme.Catalog'}</label>
          <span>
            <a href="{$product_brand_url}">{$product_manufacturer->name}</a>
          </span>
        {/if}
      </div>
    {/if}
    {* {if isset($product.reference_to_display) && $product.reference_to_display neq ''}
      <div class="product-reference">
        <label class="label">{l s='Reference' d='Shop.Theme.Catalog'} </label>
        <span itemprop="sku">{$product.reference_to_display}</span>
      </div>
    {/if} *}
  {/block}

  {block name='product_quantities'}
    {if $product.show_quantities}
      <div class="product-quantities">
        <label class="label">{l s='In stock' d='Shop.Theme.Catalog'}</label>
        <span data-stock="{$product.quantity}" data-allow-oosp="{$product.allow_oosp}">{$product.quantity}
          {$product.quantity_label}</span>
      </div>
    {/if}
  {/block}

  {block name='product_availability_date'}
    {if $product.availability_date}
      <div class="product-availability-date">
        <label>{l s='Availability date:' d='Shop.Theme.Catalog'} </label>
        <span>{$product.availability_date}</span>
      </div>
    {/if}
  {/block}

  {block name='product_out_of_stock'}
    <div class="product-out-of-stock">
      {hook h="actionProductOutOfStock"}
    </div>
  {/block}

  {block name='product_features'}
    {if $product.grouped_features}
      <div class="mb-10 tablet:mb-[50px]">
        <h2 class="description-title">{l s='Product Details' d='Shop.Theme.Catalog'}</h2>
        <section class="product-features">
          <dl class="data-sheet">
            {foreach from=$product.grouped_features item=feature}
              {if $feature.id_feature != $ASSEMBLY_LINK_FEATURE_ID}
                <dt>{$feature.name}</dt>
                <dd>{$feature.value|escape:'htmlall'|nl2br nofilter}</dd>
              {/if}
            {/foreach}
          </dl>
        </section>
      </div>
    {/if}
  {/block}

  {* if product have specific references, a table will be added to product details section *}
  {block name='product_specific_references'}
    {if !empty($product.specific_references)}
      <section class="product-features">
        <p class="h6">{l s='Specific References' d='Shop.Theme.Catalog'}</p>
        <dl class="data-sheet">
          {foreach from=$product.specific_references item=reference key=key}
            <dt class="name">{$key}</dt>
            <dd class="value">{$reference}</dd>
          {/foreach}
        </dl>
      </section>
    {/if}
  {/block}

  {block name='product_condition'}
    {if $product.condition}
      <div class="product-condition">
        <label class="label">{l s='Condition' d='Shop.Theme.Catalog'} </label>
        <link itemprop="itemCondition" href="{$product.condition.schema_url}" />
        <span>{$product.condition.label}</span>
      </div>
    {/if}
  {/block}

  <div class="mb-10 tablet:mb-[50px]">
    {foreach from=$product.grouped_features item=feature}
      {if $feature.id_feature == $ASSEMBLY_LINK_FEATURE_ID}
        <h2 class="description-title">{$feature.name}</h2>
        <a href="{$feature.value|escape:'htmlall'|nl2br nofilter}"
          class="group flex items-center text-white text-lg p-4 py-3 border border-white rounded-full hover:text-white hover:bg-main hover:border-main">
          {l s='Read more' d='Shop.Theme.Catalog'}
        </a>
      {/if}
    {/foreach}
  </div>

</div>