/**
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License version 3.0
* that is bundled with this package in the file LICENSE.txt
* It is also available through the world-wide-web at this URL:
* https://opensource.org/licenses/AFL-3.0
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade this module to a newer
* versions in the future. If you wish to customize this module for your needs
* please refer to CustomizationPolicy.txt file inside our module for more information.
*
* @author Webkul IN
* @copyright Since 2010 Webkul
* @license https://opensource.org/licenses/AFL-3.0 Academic Free License version 3.0
*/

if (typeof window.ps_checkout !== "undefined") {
    document.addEventListener('DOMContentLoaded', function () {
        initBraintreeCard();
        if (use3dVerification == false) {
            initBraintreeCvvField();
        }
        window.ps_checkout.selectors = {
            // The default payment confirmation button created by Prestashop. This will be used on the payment tunnel
            // with a express checkout order or as confirmation button for the integrated card form (hosted fields) in 1.7
            BASE_PAYMENT_CONFIRMATION: '#payment-confirmation button[type="submit"]',

            // All the TOS-like checkboxes that must be checked before the client can confirm the order.
            CONDITIONS_CHECKBOXES: '#conditions-to-approve input[type="checkbox"]',

            // Container where the 'loading screen' will be appended. The loader screen will appear to lock the
            // site until the payment has been confirmed/cancelled/errored.
            LOADER_PARENT: 'body',

            // Notification promted when the user has not accepted all the checkboxes defined with
            // `CONDITIONS_CHECKBOXES`
            NOTIFICATION_CONDITIONS: '.accept-cgv',

            // Notification promted on payment cancel
            NOTIFICATION_PAYMENT_CANCELLED: '#ps_checkout-canceled',
            // Notification promted on payment error
            NOTIFICATION_PAYMENT_ERROR: '#ps_checkout-error',
            // Container for the error extra information
            NOTIFICATION_PAYMENT_ERROR_TEXT: '#ps_checkout-error-text',

            // Container for all the payment options
            PAYMENT_OPTIONS: '.payment-options',

            // Only for Prestashop 1.7
            // Radio buttons of each payment option. This will be used to add a listener that hides the notifications
            // on payment option selection change.
            PAYMENT_OPTION_RADIOS: '.payment-options input[type="radio"][name="payment-option"]'
        };

        window.ps_checkout.events = new EventTarget();
        window.ps_checkout.events.addEventListener('payment-option-active', () => {
            $('#ps_checkout-loader').hide();
            if (wkOpcDefaultpaymentMethod != '0') {
                var firstMethod = true;
                $('.wk-payment-list').each(function () {
                    var checkStyle = $(this).attr('style');
                    if ($(this).find('input').data('module-name').indexOf('ps_checkout') > -1) {
                        if ((typeof checkStyle == 'undefined' || checkStyle == '') && firstMethod) {
                            $(this).find('input').attr('checked', true);
                            $(this).find('input').trigger('change');
                            firstMethod = false;
                        }
                    }
                });
            }
        });
    });

    $(window).load(function () {
        if (prestashop.page.page_name == 'cart'
            || prestashop.page.page_name == 'product'
        ) {
            setTimeout(() => {
                if (isPsAutoRenderDisabled) {
                    if (typeof ps_checkout !== "undefined") {
                        ps_checkout.renderExpressCheckout();
                    }
                }
            }, 1000);
        }
    });
}

