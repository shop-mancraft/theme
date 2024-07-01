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
<div class="row">
    <div class="col-lg-2">
        <div class="list-group">
            <a href="javascript:;" onclick="toggleView(this, 'wkgeneralsetting')"
                class="list-group-item {if isset($tabActive)}{if $tabActive == 'general'}active{/if}{/if}"
                data-id="general">
                <i class="icon-wrench"></i>
                {l s='General' mod='wkonepagecheckout'}
            </a>
            <a href="javascript:;" onclick="toggleView(this, 'wkcustomizer')"
                class="list-group-item {if isset($tabActive)}{if $tabActive == 'customizer'}active{/if}{/if}"
                data-id="customizer">
                <i class="icon-paint-brush"></i>
                {l s='Customization' mod='wkonepagecheckout'}
            </a>
            <a href="javascript:;" onclick="toggleView(this, 'wkloginregister')"
                class="list-group-item {if isset($tabActive)}{if $tabActive == 'loginregister'}active{/if}{/if}"
                data-id="loginregister">
                <i class="icon-user"></i>
                {l s='Login & Register' mod='wkonepagecheckout'}
            </a>
            <a href="javascript:;" onclick="toggleView(this, 'wkaddress')"
                class="list-group-item {if isset($tabActive)}{if $tabActive == 'address'}active{/if}{/if}"
                data-id="address">
                <i class="icon-book"></i>
                {l s='Address' mod='wkonepagecheckout'}
            </a>
            <a href="javascript:;" onclick="toggleView(this, 'wkshipping')"
                class="list-group-item {if isset($tabActive)}{if $tabActive == 'shipping'}active{/if}{/if}"
                data-id="shipping">
                <i class="icon-truck"></i>
                {l s='Shipping' mod='wkonepagecheckout'}
            </a>
            <a href="javascript:;" onclick="toggleView(this, 'wkpayment')"
                class="list-group-item {if isset($tabActive)}{if $tabActive == 'payment'}active{/if}{/if}"
                data-id="payment">
                <i class="icon-money"></i>
                {l s='Payment' mod='wkonepagecheckout'}
            </a>
            <a href="javascript:;" onclick="toggleView(this, 'wksociallogin')"
                class="list-group-item {if isset($tabActive)}{if $tabActive == 'sociallogin'}active{/if}{/if}"
                data-id="sociallogin">
                <i class="icon-share"></i>
                {l s='Social login' mod='wkonepagecheckout'}
            </a>
            <a href="javascript:;" onclick="toggleView(this, 'wkcart')"
                class="list-group-item {if isset($tabActive)}{if $tabActive == 'cart'}active{/if}{/if}" data-id="cart">
                <i class="icon-shopping-cart"></i>
                {l s='Cart' mod='wkonepagecheckout'}
            </a>

        </div>

        <div class="list-group">
            <a class="list-group-item">
                <i class="icon-puzzle-piece"></i> {l s='Module V' mod='wkonepagecheckout'} {$module_version}
            </a>
            <a href="https://addons.prestashop.com/en/204_webkul" target="_blank" class="list-group-item"
                style="color: #00aff0;" title="{l s='Search our more developed modules' mod='wkonepagecheckout'}">
                <i class='icon-external-link-sign'></i> {l s='More Addons' mod='wkonepagecheckout'}
            </a>
            <a href="https://addons.prestashop.com/en/ratings.php" target="_blank" class="list-group-item"
                style="color: #00aff0;" title="{l s='Rate our module' mod='wkonepagecheckout'}">
                <i class='icon-external-link-sign'></i> {l s='Rate our module' mod='wkonepagecheckout'}
            </a>
            <a href="https://addons.prestashop.com/en/contact-us?id_product=28011" target="_blank" class="list-group-item"
                style="color: #00aff0;" title="{l s='Contact us' mod='wkonepagecheckout'}">
                <i class='icon-external-link-sign'></i> {l s='Contact us' mod='wkonepagecheckout'}
            </a>
        </div>

    </div>

    <div class="col-lg-10 tab-content {if isset($tabActive)}{if $tabActive == 'general'}tab_content_active{else}tab_content_inactive{/if}{/if}"
        id="wkgeneralsetting">
        {include file="$self/views/templates/admin/_partials/wk-general-config.tpl"}
    </div>
    <div class="col-lg-10 tab-content {if isset($tabActive)}{if $tabActive == 'customizer'}tab_content_active{else}tab_content_inactive{/if}{/if}"
        id="wkcustomizer">
        {include file="$self/views/templates/admin/_partials/wk-customizer-config.tpl"}
    </div>
    <div class="col-lg-10 tab-content {if isset($tabActive)}{if $tabActive == 'loginregister'}tab_content_active{else}tab_content_inactive{/if}{/if}"
        id="wkloginregister">
        {include file="$self/views/templates/admin/_partials/wk-login-register-config.tpl"}
    </div>
    <div class="col-lg-10 tab-content {if isset($tabActive)}{if $tabActive == 'address'}tab_content_active{else}tab_content_inactive{/if}{/if}"
        id="wkaddress">
        {include file="$self/views/templates/admin/_partials/wk-address-config.tpl"}
    </div>
    <div class="col-lg-10 tab-content {if isset($tabActive)}{if $tabActive == 'shipping'}tab_content_active{else}tab_content_inactive{/if}{/if}"
        id="wkshipping">
        {include file="$self/views/templates/admin/_partials/wk-shipping-config.tpl"}
    </div>
    <div class="col-lg-10 tab-content {if isset($tabActive)}{if $tabActive == 'payment'}tab_content_active{else}tab_content_inactive{/if}{/if}"
        id="wkpayment">
        {include file="$self/views/templates/admin/_partials/wk-payment-config.tpl"}
    </div>
    <div class="col-lg-10 tab-content {if isset($tabActive)}{if $tabActive == 'sociallogin'}tab_content_active{else}tab_content_inactive{/if}{/if}"
        id="wksociallogin">
        {include file="$self/views/templates/admin/_partials/wk-social-login.tpl"}
    </div>
    <div class="col-lg-10 tab-content {if isset($tabActive)}{if $tabActive == 'cart'}tab_content_active{else}tab_content_inactive{/if}{/if}"
        id="wkcart">
        {include file="$self/views/templates/admin/_partials/wk-cart-config.tpl"}
    </div>
</div>

</div>