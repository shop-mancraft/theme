{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
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
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
{block name='login_form'}

  {block name='login_form_errors'}
    {include file='_partials/form-errors.tpl' errors=$errors['']}
  {/block}

  <form id="login-form" action="{block name='login_form_actionurl'}{$action}{/block}" method="post">

    <div>
      {block name='login_form_fields'}
        {foreach from=$formFields item="field"}
          {block name='form_field'}
            {form_field field=$field}
          {/block}
        {/foreach}
      {/block}
      <div class="forgot-password">
        <a href="{$urls.pages.password}" rel="nofollow">
          {l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
        </a>
      </div>
    </div>

    {block name='login_form_footer'}
      <footer class="form-footer text-sm-center clearfix">
        <input type="hidden" name="submitLogin" value="1">
        {block name='form_buttons'}
          <button id="submit-login" class="btn btn-primary" data-link-action="sign-in" type="submit" class="form-control-submit">
            {l s='Sign in' d='Shop.Theme.Actions'}
          </button>
        {/block}
      </footer>
    {/block}

    {widget name='pixel_cloudflare_turnstile'}
  </form>

  {* FACEBOOK Sing In *}

  <div class="socials-login">

    <div class="spacer">
      <hr><span>or</span><hr>
    </div>

    <span onclick="fb_login();" class="profile-btn-lg onclick-btn" title="{l s='Sign in with Facebook' mod='hifacebookconnect'}">
       {l s='Sign in with' d='Shop.Theme.Actions'}
       <svg width="25" height="25" viewBox="0 0 18 34" fill="none" xmlns="http://www.w3.org/2000/svg">
       <path d="M14.6624 5.64542H17.7663V0.239417C17.2308 0.16575 15.3891 0 13.2443 0C3.42398 0 6.09581 11.1208 5.70481 12.75H0.764893V18.7935H5.70339V34H11.7582V18.7949H16.497L17.2492 12.7514H11.7568C12.0231 8.75075 10.6787 5.64542 14.6624 5.64542Z" fill="white"></path>
       </svg>
    </span>

  </div>

  <style>
  .socials-login{
    max-width: 317px;
    margin: auto;
  }

  .spacer{
    display: flex;
    justify-content: space-between;
    height: 20px;
    margin: 10px 0;
    gap: 20px;
  }

  .spacer hr{
    width: 120px;
    transform: translateY(-10px);
    margin: 20px 0 !important;
  }

  </style>

  {* /end FACEBOOK Sing In *}


{/block}