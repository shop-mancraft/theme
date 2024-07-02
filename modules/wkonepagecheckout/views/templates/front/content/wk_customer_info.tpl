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
<article class="box wkrelativeposition mb-5 p-5 bg-gray-normal rounded-[5px] text-main-dark">
<div id="wkcustomer_info"></div>
    <!-- Customer details if login -->
    <div class="wk-login-container">
        <h4 class="w-max mx-auto font-normal mb-5 tablet:text-2xl text-main-dark text-xl font-main">{l s='Your details' mod='wkonepagecheckout'}</h4>
        <div class="col-md-12">
            <div class="row mb-5">
                {if $customer.is_logged && !$customer.is_guest}
                    <div class="col-md-7 col-sm-6 col-xs-6">
                        <a href="{$myaccount}" class="text-main-dark hover:text-main transition duration-200"><span>{$customer.firstname} {$customer.lastname}</span></a>
                        <p style="word-break: break-word;">{$customer.email}</p>
                    </div>
                    <div class="col-md-5 col-sm-6 col-xs-6 wk-log-btn">
                        <a href="{$logout}" class="py-3 px-4 border-2 text-main-dark uppercase border-main-dark hover:bg-main-dark hover:text-white rounded-full border-solid  transition font-body text-xs font-normal logout">{l s='Logout' mod='wkonepagecheckout'}</a>
                    </div>
                {/if}
            </div>
        </div>
    </div>

    {if $customer.is_logged && !$customer.is_guest}
        <!-- If customer is login -->
        {block name='wk-customer-address'}
            {include file='module:wkonepagecheckout/views/templates/front/content/_partials/wk-myaccount.tpl'}
        {/block}

    {else}
        {if Configuration::get('WK_CHECKOUT_SOCIAL_LOGIN')}
            {if Configuration::get('WK_CHECKOUT_FACEBOOK_LOGIN') || Configuration::get('WK_CHECKOUT_GOOGLE_LOGIN')}
                <!-- If customer is not login -->
                <div class="wk-social-login clearfix">
                    {* <h5>{l s='Sign in with' mod='wkonepagecheckout'}</h5> *}
                    <div id="status" class="wkerrorcolor"></div>
                    {if Configuration::get('WK_CHECKOUT_FACEBOOK_LOGIN')}
                        <a class="btn btn-primary wkbtn-fb" href="javascript:void(0);" onclick="fbLogin()" id="fbLink">
                            <span style="text-transform:initial;">{l s='Sign in with Facebook' mod='wkonepagecheckout'}</span>
                        </a>
                    {/if}
                    {if Configuration::get('WK_CHECKOUT_GOOGLE_LOGIN')}
                        <div id="g_id_onload"
                            data-client_id="{$wk_google_app_client_id}"
                            data-context="signin"
                            data-ux_mode="popup"
                            data-callback="wkGoogleConnectResponse"
                            data-nonce=""
                            data-auto_prompt="true">
                        </div>
                        <div class="g_id_signin"
                            data-type="standard"
                            data-shape="rectangular"
                            data-theme="filled_blue"
                            data-text="signin_with"
                            data-size="large"
                            data-logo_alignment="left">
                        </div>
                    {/if}
                </div>
            {/if}
        {/if}
        <div class="wk-guest-checkout">
            {if Configuration::get('WK_CHECKOUT_GUEST_ALLOW')}
                <h5 class="text-xl font-normal text-left mb-5">{l s='Guest Checkout' mod='wkonepagecheckout'}</h5>
            {else}
                <h5 class="text-xl font-normal text-left mb-5">{l s='Create Account' mod='wkonepagecheckout'}</h5>
            {/if}
        </div>

        <div class="wk-form-group !mb-0">
            {if Configuration::get('WK_CHECKOUT_SOCIAL_TITLE')}
                <div class="form-group">
                    <label class="label-control">{l s='Social title' mod='wkonepagecheckout'}</label>
                    {if isset($genders)}
                        {foreach from=$genders item="label" key="value"}
                            <div class="wk-gender">
                                <input type="radio" name="id_gender" value="{$value}"
                                    {if isset($wkguest) && ($wkguest->id_gender == $value)}checked="checked" {/if}>
                                <label for="id_gender">{$label}</label>
                            </div>
                        {/foreach}
                    {/if}
                </div>
            {/if}
            <div class="form-group !mb-2">
                <input value="{if isset($wkguest)}{$wkguest->email}{/if}" maxlength="128" type="text" name="wk-email"
                    id="wk-email" placeholder="{l s='Email' mod='wkonepagecheckout'}"  class="form-control text-sm border-gray-normal border-solid border rounded-full bg-gray-normal h-[50px] tablet:h-10">
                <i class="material-icons wk-check-icon wkhide icon_wk_email">&#xE876;</i>
                <i class="material-icons wk-error-icon wkhide error_wk_email">&#xE001;</i>
                <span id="wk-email-error" class="wkerrorcolor"></span>
            </div>
            {if Configuration::get('WK_CHECKOUT_GUEST_ALLOW') && !isset($wkguest)}
                <div class="form-group">
                    <span>
						<label class="text-xs text-gray-dark">
							<input type="checkbox" value="1" name="wk-create-account" id="wk-create-account" class="mr-2 bg-gray-normal border-2 border-gray-3000 border-solid checked:bg-main-dark checked:focus:bg-main-dark checked:hover:bg-main-dark focus:ring-0 focus:ring-transparent form-checkbox opacity-100 outline-none rounded transition">
							{l s='I also want to create account' mod='wkonepagecheckout'}
						</label>
					</span>
                </div>
            {/if}
            <div class="form-group wkpassword_div {if Configuration::get('WK_CHECKOUT_GUEST_ALLOW')}wkhide{/if}">
                <input maxlength="60" type="password" name="wk-password" id="wk-password" placeholder="{l s='Password' mod='wkonepagecheckout'}" class="form-control border-gray-normal border-solid border rounded-full bg-gray-normal h-[50px] tablet:h-10">
                <i class="material-icons wk-check-icon wkhide icon_wk_password">&#xE876;</i>
                <i class="material-icons wk-error-icon wkhide error_wk_password">&#xE001;</i>
                <span id="wk-password-error" class="wkerrorcolor"></span>
            </div>

            {if Configuration::get('WK_CHECKOUT_DOB')}
                {if isset($wkguest) && ($wkguest->birthday)}
                    {assign var="birthdate" value=explode('-', $wkguest->birthday)}
                {/if}
                <div class="form-group">
                    <label class="label-control">{l s='Date of birth' mod='wkonepagecheckout'}</label>
                    <div class="row">
                        <div class="col-md-4 col-xs-12 pad-right-0">
                            <select name="wk_day" id="wk_day" class="form-control bg-gray-normal border border-solid border-gray-normal focus:border-gray-3000 focus:ring-0 font-body font-medium form-control-select form-select js-country pl-4 rounded-full w-full">
                                <option value="0">{l s='Day' mod='wkonepagecheckout'}</option>
                                {for $day=1 to 31}
                                    <option value="{$day}" {if isset($birthdate[2]) && ($birthdate[2] == $day)}selected{/if}>{$day}
                                    </option>
                                {/for}
                            </select>
                        </div>
                        <div class="col-md-4 col-xs-12 pad-right-0">
                            <select name="wk_month" id="wk_month" class="form-control bg-gray-normal border border-solid border-gray-normal focus:border-gray-3000 focus:ring-0 font-body font-medium form-control-select form-select js-country pl-4 rounded-full w-full">
                                <option value="0">{l s='Month' mod='wkonepagecheckout'}</option>
                                {for $month=1 to 12}
                                    <option value="{$month}" {if isset($birthdate[1]) && ($birthdate[1] == $month)}selected{/if}>
                                        {$month}</option>
                                {/for}
                            </select>
                        </div>
                        <div class="col-md-4 col-xs-12 pad-right-0">
                            <select name="wk_year" id="wk_year" class="form-control bg-gray-normal border border-solid border-gray-normal focus:border-gray-3000 focus:ring-0 font-body font-medium form-control-select form-select js-country pl-4 rounded-full w-full">
                                <option value="0">{l s='Year' mod='wkonepagecheckout'}</option>
                                {for $year=date(Y)-100 to date(Y)}
                                    <option value="{$year}" {if isset($birthdate[0]) && ($birthdate[0] == $year)}selected{/if}>
                                        {$year}</option>
                                {/for}
                            </select>
                        </div>
                    </div>
                </div>
            {/if}

            {if Configuration::get('WK_CHECKOUT_OPTIN')}
                <div class="form-group">
                    <span class="custom-checkbox">
                        <label>
                            <input type="checkbox" value="1" name="wk-optin" id="wk-optin" class="form-control"
                                {if isset($wkguest) && ($wkguest->optin == 1)}checked="checked" {/if}>
                            <span><i class="material-icons checkbox-checked"></i></span>
                            {l s='Receive offers from our partners' mod='wkonepagecheckout'}
                        </label>
                    </span>
                </div>
            {/if}

            {if Configuration::get('WK_CHECKOUT_NEWSLATTER')}
                <div class="form-group">
                    <span class="custom-checkbox">
                        <label>
                            <input type="checkbox" value="1" name="wk-newsletter" id="wk-newsletter" class="form-control"
                                {if isset($wkguest) && ($wkguest->newsletter == 1)}checked="checked" {/if}>
                            <span><i class="material-icons checkbox-checked"></i></span>
                            {l s='Sign up for our newsletter' mod='wkonepagecheckout'}
                        </label>
                    </span>
                </div>
            {/if}
        </div>

        {if !$customer.is_logged || $customer.is_guest}
            <a href="javascript:void(0)" class="block underline text-main-dark hover:text-main mx-auto mb-8 text-sm transition duration-200 w-max leo-quicklogin" data-enable-sociallogin="enable" data-type="popup" data-layout="login">{l s='Already registered?' mod='wkonepagecheckout'}</a>
        {/if}

        {block name='wk-customer-address'}
            {include file='module:wkonepagecheckout/views/templates/front/content/_partials/wk-myaccount.tpl'}
        {/block}



        <!-- Login pop up tpl in case customer is not login -->
        {* {block name='wk-login'}
            {include file='module:wkonepagecheckout/views/templates/front/content/_partials/wk_login.tpl'}
        {/block} *}

        {*{block name='wk-social-login'}
			{include file='module:wkonepagecheckout/views/templates/front/content/_partials/wk-social-login.tpl'}
		{/block}*}
    {/if}

</article>

{if Configuration::get('WK_CHECKOUT_GOOGLE_LOGIN')}
<script src="https://accounts.google.com/gsi/client?hl={$wk_iso}" async="" defer=""></script>
<script>
    if (typeof wk_google_app_key !== 'undefined' && wk_google_app_key) {
        function wkGoogleConnectResponse(res) {
            fetch('https://oauth2.googleapis.com/tokeninfo?id_token=' + res.credential)
            .then((response) => response.json())
            .then((data) => {
                if (data) {
                    let first_name = data.given_name;
                    let last_name = data.family_name;
                    let email = data.email;
                    if (!last_name) {
                        first_name = last_name;
                    }
                    if (first_name == '' || last_name == '' || email == '') {
                        alert(user_cancel);
                    } else {
                        proceedLogin(first_name, last_name, email);
                    }
                } else {
                    alert(user_cancel);
                }
            });
        }
    }
</script>
{/if}

