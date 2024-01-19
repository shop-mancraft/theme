{*
*  @author    TemplateTrip
*  @copyright 2015-2017 TemplateTrip. All Rights Reserved.
*  @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
*}

{if isset($wishlists) && count($wishlists) > 1}
    <div class="wishlist">
        {foreach name=wl from=$wishlists item=wishlist}
            {if $smarty.foreach.wl.first}
                <a class="wishlist_button_list btn btn-primary" tabindex="0" data-toggle="popover" data-trigger="focus"
                    title="{l s='Add to wishlist' mod='ttproductwishlist'}"
                    data-placement="bottom"><span>{l s='Add to wishlist' mod='ttproductwishlist'}</span></a>
                <div hidden class="popover-content">
                    <div class="cluetipblock">
                    {/if}
                    <a title="{$wishlist.name|escape:'html':'UTF-8'}" data-dismiss="modal" value="{$wishlist.id_wishlist}"
                        onclick="WishlistCart('wishlist_block_list', 'add', '{$product.id_product|intval}', '{$product.id_product_attribute|intval}', 1, '{$wishlist.id_wishlist}');">
                        <span>
                            {l s='Add to %s' sprintf=[$wishlist.name] mod='ttproductwishlist'}
                        </span>
                    </a>
                    {if $smarty.foreach.wl.last}
                    </div>
                </div>
            {/if}
        {foreachelse}
            <a href="#" id="wishlist_button_nopop" data-dismiss="modal"
                onclick="WishlistCart('wishlist_block_list', 'add', '{$id_product|intval}', $('#idCombination').val(), document.getElementById('quantity_wanted').value); return false;"
                data-rel="nofollow" title="{l s='Add to wishlist' mod='ttproductwishlist'}" class="btn btn-primary">
            </a>
        {/foreach}
    </div>
{else}
    <div class="wishlist">
        <button class="hidden group wishlistProd_{$product.id_product|intval}" href="#" data-dismiss="modal"
            data-rel="{$product.id_product|intval}" title="{l s='Add to wishlist' mod='ttproductwishlist'}"
            onclick="WishlistCart('wishlist_block_list', 'add', '{$product.id_product|intval}', '{$product.id_product_attribute|intval}', 1); return false;">
            <svg xmlns="http://www.w3.org/2000/svg"
                class="w-9 h-9 tablet:w-10 tablet:h-10 stroke-[#BDBDBD] group-hover:stroke-main" viewBox="0 0 40 40"
                fill="none">
                <path
                    d="M36.6669 14.77C36.6726 17.3346 35.6846 19.8017 33.9102 21.6533C29.8419 25.8717 25.8952 30.27 21.6769 34.3333C20.7086 35.25 19.1736 35.2167 18.2486 34.2583L6.09023 21.655C2.41523 17.845 2.41523 11.695 6.09023 7.88667C6.9588 6.975 8.00346 6.2492 9.16088 5.75329C10.3183 5.25737 11.5644 5.00167 12.8236 5.00167C14.0828 5.00167 15.3288 5.25737 16.4863 5.75329C17.6437 6.2492 18.6883 6.975 19.5569 7.88667L20.0002 8.34333L20.4419 7.88667C21.3122 6.97716 22.3572 6.25269 23.5142 5.75667C24.6712 5.26065 25.9164 5.00329 27.1752 5C29.7086 5 32.1302 6.04 33.9086 7.88667C35.6836 9.73807 36.6722 12.2052 36.6669 14.77Z"
                    stroke-width="1.5" stroke-linejoin="round" />
            </svg>
        </button>
        <a class="addToWishlist btn btn-primary wishlistProd_{$product.id_product|intval}" href="#" data-dismiss="modal"
            data-rel="{$product.id_product|intval}" title="{l s='Add to wishlist' mod='ttproductwishlist'}"
            onclick="WishlistCart('wishlist_block_list', 'add', '{$product.id_product|intval}', '{$product.id_product_attribute|intval}', 1); return false;">
        </a>
    </div>
{/if}