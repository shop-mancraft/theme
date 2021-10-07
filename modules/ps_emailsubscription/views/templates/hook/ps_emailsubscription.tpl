{**
 * 2007-2020 PrestaShop
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
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<div class="block_newsletter text-left tablet-narrow:text-left py-5 w-full float-left px-4 my-4">
  <div class="align-middle flex flex-col flex-wrap justify-between tablet-narrow:flex-row w-full">
    <div class="flex flex-1 flex-col items-center tablet-wide:items-start mb-4 mx-auto tablet-narrow:mb-0 tablet-narrow:ml-0 tablet-narrow:w-1/2">
      <h1 class="flex flex-1 flex-col font-medium items-center leading-tight tablet-narrow:flex-row tablet-narrow:text-2xl tablet-narrow:text-left text-2xl text-center text-white tracking-pixel">
        <i class="bg-white flex h-12 items-center justify-center m-auto material-icons material-icons-outlined mb-2 rounded-full tablet-narrow:mb-0 tablet-narrow:ml-0 tablet-narrow:mr-3 text-3xl text-primary w-12">drafts</i>
        {l s='Sign up for Newsletter' d='Shop.Theme.Global'}
      </h1>
	<p class="flex flex-1 flex-col text-white tablet-narrow:pr-8">{l s='We are constantly developing our products and expanding our offer with new innovative solutions. We are passionate about the Airsoft: with us, you won\'t miss a thing. By subscribing to our newsletter about promotions and news, you will learn even faster. Don\'t worry, we do not spam :)' d='Shop.Theme.Global'}</p>
    </div>

    <div class="tablet-narrow:w-1/2 w-full flex flex-col justify-center">
      {if $msg}
        <p class="alert {if $nw_error}alert-danger{else}alert-success{/if}">
          {$msg}
        </p>
      {/if}
      <form action="{$urls.pages.index}#footer" method="post" class="flex flex-col">
        <div class="">
		      <div class="flex flex-col phone:flex-row">
            <input
              class="border-2 border-white btn btn-primary h-10 order-5 phone:rounded-l-none phone:rounded-r text-black"
              name="submitNewsletter"
              type="submit"
              value="{l s='Subscribe' d='Shop.Theme.Actions'}"
            >
            <div class="flex-1 input-wrapper mb-2 phone:mb-0">
              <input
                name="email"
                type="email"
                value="{$value}"
                placeholder="{l s='Your email address' d='Shop.Forms.Labels'}"
                aria-labelledby="block-newsletter-label"
                required
                class="h-10 px-3 phone-wide:px-0 phone-wide:pl-5 rounded-l rounded-r phone:rounded-r-none w-full"
              >
            </div>
            <input type="hidden" name="action" value="0">
            <div class="clearfix"></div>
          </div>
          <div class="w-full p-0 flex mt-2">
            {if $conditions}
              <input type="checkbox" class="border border-white checked:bg-white flex-none h-4 mr-2 w-4" name="legal-agreements" id="legal-agreements" required/>
              <label for="legal-agreements" class="leading-normal text-white text-xs text-left float-left w-auto"><span id="newsletter-short-text">{$conditions|truncate:90:"":false:false} <a onclick="handleReadMoreNewsletter(this);" href="javascript:void(0)" class="duration-300 transition-colors">{l s=' ... more' d='Shop.Theme.Global'}</a></span><span id="agreement-newsletter-more" style="display: none;"> {$conditions}</span></label>

              <script type="text/javascript">
                //<![CDATA[
                var handleReadMoreNewsletter = function(elem) {
                  $("#newsletter-short-text").hide();
                  $('#agreement-newsletter-more').show();
                }
                //]]>
              </script>
            {/if}
          </div>
        </div>
      </form>
    </div>
  </div>
</div>