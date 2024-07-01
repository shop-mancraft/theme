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
{if is_array($product.customizations) && $product.customizations|count}
    <br>
    {block name='cart_detailed_product_line_customization'}
    {foreach from=$product.customizations item="customization"}
        <a href="#" data-toggle="modal" data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
        <div class="modal fade customization-modal" id="product-customizations-modal-{$customization.id_customization}" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">{l s='Product customization' d='Shop.Theme.Catalog'}</h4>
            </div>
            <div class="modal-body">
                {foreach from=$customization.fields item="field"}
                <div class="product-customization-line row">
                    <div class="col-sm-3 col-xs-4 label">
                    {$field.label}
                    </div>
                    <div class="col-sm-9 col-xs-8 value">
                        {if $field.type == 'text'}
                            {if (int)$field.id_module}
                            {$field.text nofilter}
                            {else}
                            {$field.text}
                            {/if}
                        {elseif $field.type == 'image'}
                            <img src="{$field.image.small.url}">
                        {/if}
                    </div>
                </div>
                {/foreach}
            </div>
            </div>
        </div>
        </div>
    {/foreach}
    {/block}
{/if}
