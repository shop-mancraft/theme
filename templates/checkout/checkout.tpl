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
<!doctype html>
<html lang="{$language.iso_code}">

  <head>
    {block name='head'}
      {include file='_partials/head.tpl'}
    {/block}
  </head>

  <body id="{$page.page_name}" class="{$page.body_classes|classnames}">

    {block name='hook_after_body_opening_tag'}
      {hook h='displayAfterBodyOpeningTag'}
    {/block}
	<div id="page" class="">
    <header id="header">
      {block name='header'}
        {include file='_partials/header.tpl'}
      {/block}
    </header>

    {block name='notifications'}
      {include file='_partials/notifications.tpl'}
    {/block}

    <section id="wrapper">
      {hook h="displayWrapperTop"}
      <div class="container">
      {block name='content'}
        <section id="content">
          <div class="row">
            <div class="col-md-8">
              {block name='cart_summary'}
                {render file='checkout/checkout-process.tpl' ui=$checkout_process}
              {/block}
            </div>
            <div class="col-md-4">

              {block name='cart_summary'}
                {include file='checkout/_partials/cart-summary.tpl' cart = $cart}
              {/block}

              {hook h='displayReassurance'}
            </div>
          </div>
        </section>
      {/block}
      </div>
      {hook h="displayWrapperBottom"}
    </section>

    <footer id="footer">
      {block name='footer'}
        {include file='_partials/footer.tpl'}
      {/block}
    </footer>
	</div>
    {block name='javascript_bottom'}
      {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
    {/block}

    {block name='hook_before_body_closing_tag'}
      {hook h='displayBeforeBodyClosingTag'}
    {/block}

    <!-- Fix error -->
    <script>
    window.close_text = 'Close';
    (function($) {

    $(document).ready(function() {
      $('.carrier-extra-content').css('display', 'block');

      $(document).on('click','label[for="delivery_option_433"]', function(){
        $('.carrier-extra-content').css('display', 'block');
        if($('input#delivery_option_433').attr('checked') == 'checked' && $('.js-inpost-shipping-machine-name').text().trim().length < 1){
          $('.js-inpost-shipping-choose-machine').click();
        }
      });
    });

    })(jQuery);
    </script>

	<!-- Loyalty Program Checkbox -->
	<script>
      (function($) {
            $.ajax({
              type: "POST",
              url: '/modules/webo_loyaltycheckbox/ajax.php',
              headers: { "cache-control": "no-cache" },
              data : {
                ajax : true,
                action : 'check',
                mode: this.checked,
              }
            }).success(function(data){
				var data = JSON.parse(data);
				if(data && data != ''){
					if(data.result){
						$('#loyalty_program_agreement').addClass('hidden');
					}
				}
            });

           $('#conditions_to_approve\\[conditions-loyalty-program\\]').change(function(e) {
            e.preventDefault(); // avoid to execute the actual submit of the form.
            var buttonSubmitState = jQuery('#payment-confirmation [type="submit"]').attr('disabled') ? true : false;
            jQuery('#payment-confirmation [type="submit"]').attr('disabled', 'disabled');
            $.ajax({
              type: "POST",
              url: '/modules/webo_loyaltycheckbox/ajax.php',
              headers: { "cache-control": "no-cache" },
              data : {
                ajax : true,
                action : 'update',
                mode: this.checked,
              }
            }).always(function(){
                jQuery('#payment-confirmation [type="submit"]').attr('disabled', (buttonSubmitState ? 'disabled' : false));
            });

        });
      })(jQuery);
    </script>

  </body>

</html>
