{block name='page_title'}
    {l s='Loyalty Program - exchange products' mod='pshowloyaltyprogram'}
{/block}

{extends file='page.tpl'}
{block name='page_content'}
    {if Configuration::get('PSHOW_LP_PRODUCT_EXCHANGE')}
        <h1 class="page-subheading">
            {l s='Account balance' mod='pshowloyaltyprogram'}: <strong>{(isset($bank) and $bank) ? $bank->getPoints() : 0} {l s='Points' mod='pshowloyaltyprogram'}</strong>
        </h1>
        <section id="products">
            <div class="block-center" id="block-points">
                <div id="js-product-list">
                    <div class="products product-thumbs flex flex-row flex-wrap -mx-4">
                        {foreach from=$products item="product"}
                            {include file="module:pshowloyaltyprogram/views/templates/front/_partials/product.tpl" product=$product}
                        {/foreach}
                    </div>
                </div>
            </div>
        </section>
        <div id="exchangePanel" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h3 class="modal-title text-white">{l s='Exchange panel' mod='pshowloyaltyprogram'}</h3>
                        <div style="display: none" id="voucherError" class="alert alert-danger"></div>
                        <div id="productDetails">
                            <h3 class="mb-4">
                                {if $language.language_code == 'pl-pl'}
                                    Czy na pewno chcesz wymienić swoje punkty na tę nagrodę? Wybrana nagroda zostanie automatycznie dodana w formie kuponu do twojego koszyka.
                                {/if}
                                {if $language.language_code == 'en-US'}
                                    Are you sure you want to redeem your points for this reward? The selected prize will be automatically added as a coupon to your cart.
                                {/if}
                            </h3>
                            <div id="exConfirmation"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            var ajaxUrl = decodeURIComponent('{$ajaxUrl}');
        </script>
    {/if}
{/block}