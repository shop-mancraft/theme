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

<div class="wk-products">
    {if isset($products)}
        <section class="page-content card card-block featured-products clearfix m-t-3" id="wk-products">
            <h2 class="h2 wk-section-title">{l s='Customers who bought this product also bought:' mod='wkonepagecheckout'}</h2>
            <div class="products row">
                {foreach from=$products item="product"}
                    {include file="module:wkonepagecheckout/views/templates/hook/wk-product.tpl" product=$product productClasses="col-xs-6 col-lg-4 col-xl-3"}
                {/foreach}
            </div>
        </section>
    {/if}
</div>
