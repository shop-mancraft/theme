<hr />
<h2 class="h3 product-title" itemprop="name">{$product->name}</h2>
{foreach from=$attributes item=attribute}
    <li>{$attribute.group}: {$attribute.name}</li>
{/foreach}
<form method="post">
    <input type="hidden" name="action" value="confirmExchange"/>
    <input type="hidden" name="id_product" value="{$product->id}"/>
    <input type="hidden" name="id_product_ex" value="{$idProductEx}"/>
    <div class="form-group text-right">
        <button type="submit" class="btn btn-primary">{l s='Confirm' mod='pshowloyaltyprogram'}</button>
    </div>
</form>