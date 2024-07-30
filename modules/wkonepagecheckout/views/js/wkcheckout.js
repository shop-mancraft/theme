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

var updateAddrState = 1;
$(document).ready(function () {
    if ($('.js-checkout-modal').length) {
        $('.js-checkout-modal').remove();
    }

    if ($("#wk-products .products").length > 0) {
        $("article.product-miniature").css("height", "400px");
        $("article .thumbnail-container").css("height", "350px");
        $("article .product-description").css("height", "120px");
        $("article .highlighted-informations").css("height", "6.125rem");
    }

    compatibleWithPsMembership();
    compatibleWithWkProductTrial();
    // refresh cart information when customer/visitor vist the cart page
    updateOrderSummary().then(function (ordersummaryresponse) {
        if (ordersummaryresponse) {
            updateShippingorPayment();
        }
    });

    updateCartAddress();
    //---------------------------------------------------------------------

    $(document).on('click', '.wkcustomizerbtn', function () {
        disabledOrderButton();
    });

    $(document).on('change', '#input_recyclable', function () {
        if ($(this).is(':checked')) {
            addPackRecyclablePack(1);
        } else {
            addPackRecyclablePack(0);
        }
    });

    $(document).on('change', '#input_gift', function () {
        if ($(this).is(':checked')) {
            $('#wkgift').slideDown();
            addGiftMessage(1);
        } else {
            $('#wkgift').slideUp();
            addGiftMessage(0);
        }
    });

    $(document).on('blur', '#gift_message', function () {
        if ($('#input_gift').is(':checked')) {
            addGiftMessage(1);
        }
    });

    $(document).on('blur', '#delivery_message', function () {
        if (id_cart) {
            $.ajax({
                type: 'POST',
                url: wkcheckout,
                async: false,
                data: {
                    'ajax': true,
                    'id_cart': id_cart,
                    'id_customer': id_customer,
                    'token': wktoken,
                    'message': $('#delivery_message').val(),
                    'action': 'addDeliveryMessage',
                },
                success: function (result) {
                    Window.token = result;
                },
            });
        }
    });

    if (typeof wk_mpcartsplit_enabled != 'undefined') {
        $(document).ajaxComplete(function (event, xhr, settings) {
            var requestedUrl = settings.data;
            if (requestedUrl.indexOf('carrier_list=') > -1 && requestedUrl.indexOf('&delivery_option') > -1) {
                updateOrderSummary();
                var idCountry = $('select[name=wk_delivery_address_country] option:selected').val();
                if (wk_is_logged == 0) {
                    var idCountry = $('select[name=wk_delivery_address_country] option:selected').val();
                    if (typeof idCountry !== 'undefined') {
                        updatePaymentMethod(0, idCountry, false);
                    } else {
                        updatePaymentMethod(1, false, false);
                    }
                } else {
                    updatePaymentMethod(1, false, false);
                }
            }
        });
    }

    //	Show login pop for guest
    $(document).on('click', '.wkbtn-login', function () {
        $('#wk-login-email').removeClass('border-error');
        $('.wk-login-error').html('');
        $('.wk-login-error').removeClass('wkshow').addClass('wkhide');
        $('#wk_login_pop').modal('show');
    });

    //	If guest want to create account then show password input field
    $(document).on('click', '#wk-create-account', function () {
        if ($(this).is(":checked")) {
            $('.wkpassword_div').show();
        } else {
            $('.wkpassword_div').hide();
        }
    });

    //	Process login
    $(document).on('submit', '#wk-login-form', function (e) {
        e.preventDefault();
        var params = $('#wk-login-form').serialize();
        loginSubmit('validateLogin', params, 'login');
    });

    //	Validate email enter by guest
    $(document).on('blur', '#wk-email', function () {
        if (validateGuestEmail()) {
            var email = $('#wk-email').val();
            if ($('#wk-create-account').is(":checked")) {
                var is_guest = 0;
            } else {
                var is_guest = 1;
            }
            checkEmailExist(email, is_guest);
        }
    });

    //	Validate password enter by guest
    $(document).on('blur', '#wk-password', function () {
        validatePassword();
    });

    // As soon as customer/vistor chnage the shipping , refresh payment method accordingly
    $(document).on('change', '.wk_selected_shipping', function () {
        var idCarrier = removeCommaFromShipping($(this).val());
        var idCountry = false;
        var selectedDeliveryAddress = $('input[name=wk-delivery-address]:checked').val();

        $('.wk-shipping-info').removeClass('wkSelectedBorder');
        if (typeof selectedDeliveryAddress === 'undefined') {
            idCountry = $('select[name=wk_delivery_address_country] option:selected').val();
        }
        setDeliveryMethod(idCarrier, idCountry, true, false);
        $('.wk-selected-shipping-' + idCarrier).addClass('wkSelectedBorder');
    });

    $(document).on('change', 'input[name=payment-option]', function () {
        $('.wk-payment-info').removeClass('wkSelectedBorder');
        $('.wk-selected-payment-' + $(this).attr('id')).addClass('wkSelectedBorder');
        $('#' + $(this).attr('id') + '-additional-information').css({ 'display': 'inline-block' });
    });

    $(document).on('change', 'input[name="wk-delivery-address"]', function () {
        setTimeout(() => {
            showNewDeliveryAddress($(this).val());
        }, 1000);
    });

    $(document).on('change', 'input[name="wk-invoice-address"]', function () {
        setTimeout(() => {
            showInvoiceAddress($(this).val());
            var idCountry = $('select[name=wk_invoice_address_country] option:selected').val();
            getStateByIdCountry(idCountry, 'invoice');
        }, 1000);
    });

    $(document).on('change', '#wk-existing-delivery-address', function () {
        var idAddress = $(this).val();
        if ($('input[name="wk-different-invoice"]').is(":checked")) {
            var idAddressInvoice = idAddress;
        } else {
            var idAddressInvoice = $('#wk-existing-invoice-address option:selected').val();
        }
        updateCustomerAddress(idAddress, idAddressInvoice, 'delivery', true, true);
    });

    $(document).on('change', '#wk-existing-invoice-address', function () {
        var idAddressInvoice = $(this).val();
        if ($('input[name="wk-different-invoice"]').is(":checked")) {
            var idAddress = idAddressInvoice;
        } else {
            var idAddress = $('#wk-existing-delivery-address option:selected').val();
        }
        updateCustomerAddress(idAddress, idAddressInvoice, 'invoice', true, true);
    });

    //	Increase product quantity into the cart
    $(document).on('click', '.wk-qty-up', function () {
        var obj = $(this);
        var currentQty = $(this).parent().siblings('input.wk-hidden-qty').val();
        currentQty = parseInt(currentQty) + 1;
        //$(this).parent().siblings('input.wk-qty').val(currentQty);

        changeCartQuantity(obj, 'updateQty', 'up', 1, false);
    });

    //	Decrease product quantity from the cart
    $(document).on('click', '.wk-qty-down', function () {
        var obj = $(this);
        var currentQty = $(this).parent().siblings('input.wk-hidden-qty').val();
        currentQty = parseInt(currentQty) - 1;
        //$(this).parent().siblings('input.wk-qty').val(currentQty);

        changeCartQuantity(obj, 'updateQty', 'down', 1, false);
    });

    $(document).on('blur', 'input[name=wk-cart-qty]', function () {
        $('.wkorder_error').hide().text('');
        var obj = $(this);
        var inputQty = $(this).val();
        var idProduct = $(this).attr('data-id-product');
        var idProductAttribute = $(this).attr('data-id-product-attribute');
        var currentQty = $('input[data-id-product=' + idProduct + '][data-id-product-attribute=' + idProductAttribute + ']').val();

        if (inputQty < 0) {
            $('.wkorder_error').show().text(qty_less);
            return false;
        } else if (inputQty > currentQty) {
            var condition = 'up';
        } else if (inputQty < currentQty) {
            var condition = 'down';
        }
        changeCartQuantity(obj, 'updateQty', condition, Math.abs(inputQty - currentQty), true);
    });

    //	Delete product from the cart
    $(document).on('click', '#wk-remove-cart', function () {
        var obj = $(this);
        changeCartQuantity(obj, 'deleteCartProduct', false, false, false);
    });

    //	Disabled invoice tab in case delivery address selected same as invoice
    $(document).on('click', 'input[name="wk-different-invoice"]', function () {
        updateCartAddress();
    });

    //	Disabled invoice tab in case delivery address selected same as invoice
    $(document).on('click', '#wk_new_invoice_address', function () {
        if ($(this).is(":checked")) {
            $('.wk-new-invoice').addClass('disabled');
            $('.wk-new-invoice a').removeAttr('data-toggle');
        } else {
            $('.wk-new-invoice').removeClass('disabled');
            $('.wk-new-invoice a').attr('data-toggle', 'tab');
        }
    });

    //	Add available voucher on cart
    $(document).on('click', '#addVoucher', function () {
        var discountName = $('#wk-voucher').val();
        addVoucherOnCart(discountName);
    });

    //	Delete applied voucher from the cart
    $(document).on('click', '#wk-delete-voucher', function () {
        var idVoucher = $(this).attr('data-id');
        if (idVoucher) {
            deleteCartVoucher(idVoucher)
        }
    });

    //	On changing country get states based on country
    $(document).on('change', '.wk_address_country', function () {
        var idCountry = $(this).val();
        var dataAttr = $(this).attr('data-attr');
        updateAddrState = 1;
        renderPsAddress(idCountry, dataAttr).then(function (addressForm) {
            if (addressForm) {
                getStateByIdCountry(idCountry, dataAttr);
            }
        });
    });

    //	On changing state update carrier/payment methods
    $(document).on('change', '.wk_address_state', function () {
        var idCountry = $('.wk_address_country option:selected').val();
        var idState = $(this).val();
        var dataAttr = $(this).attr('data-attr');
        if (dataAttr == 'delivery') {
            updateShippingMethod(1, idCountry, idState).then(function (updateshippingresponse) {
                if (updateshippingresponse) {
                    updatePaymentMethod(0, idCountry, 0);
                }
            });
        }
    });

    if (typeof address_exist === 'undefined') {
        // On load check delivery selected country
        var idCountry = $('.wk_address_country option:selected').val();
        var dataAttr = 'delivery';
        getStateByIdCountry(idCountry, dataAttr);

        // On load check invoice selected country
        var idCountry = $('select[name=wk_invoice_address_country] option:selected').val();
        var dataAttr = 'invoice';
        getStateByIdCountry(idCountry, dataAttr);
    }

    //	Validate delivery and invoice address field
    $(document).on('blur', '.wkvalidatefield', function (e) {
        if (typeof inline !== 'undefined' && !e.relatedTarget?.classList.contains('wk-save-address')) {
            var fieldValue = $.trim($(this).val());
            var fieldId = $(this).attr('id');
            var maxlength = $(this).attr('maxlength');
            var required = $(this).attr('data-required');
            var fieldValidation = $(this).attr('data-validate');

            if (!fieldValue) {
                if (required == 1) {
                    $('#' + fieldId).addClass('border-error').removeClass('border-success');
                    $('.error_' + fieldId).addClass('wkshow').removeClass('wkhide');
                    $('.icon_' + fieldId).addClass('wkhide').removeClass('wkshow');
                }
            } else {
                if (typeof maxlength !== 'undefinded') {
                    if (fieldValue.length > maxlength) {
                        $('#' + fieldId).addClass('border-error').removeClass('border-success');
                        $('.error_' + fieldId).addClass('wkshow').removeClass('wkhide');
                        $('.icon_' + fieldId).addClass('wkhide').removeClass('wkshow');
                        $('.' + fieldId).text(error_length);
                    } else {
                        if (fieldId == 'wk_delivery_address_zip') {
                            var idCountry = $('select[name=wk_delivery_address_country] option:selected').val();
                            validatePostalCode(fieldValue, fieldId, idCountry);
                        } else if (fieldId == 'wk_invoice_address_zip') {
                            var idCountry = $('select[name=wk_invoice_address_country] option:selected').val();
                            validatePostalCode(fieldValue, fieldId, idCountry);
                        } else {
                            validateAddressField(fieldValue, fieldId, fieldValidation, maxlength, required);
                        }
                    }
                } else {
                    validateAddressField(fieldValue, fieldId, fieldValidation, maxlength, required);
                }
            }
        }
    });

    //	Save customer delivery and invoice address by clicking on save button
    $(document).on('submit', '.wk-address-form', function (e) {
        e.preventDefault();
        var dataType = $(this).attr('data-type');
        $('#wk-msg-new' + dataType).hide().text('');
        if (dataType == 'delivery') {
            var formData = $('#wk-delivery-form').serialize();
        } else if (dataType == 'invoice') {
            var formData = $('#wk-invoice-form').serialize();
        }
        var no_error = true;

        if (wk_is_logged == 0 && customer_is_guest == 0) {
            no_error = validateGuestEmail();
            if (no_error == true) {
                var email = $('#wk-email').val();
                if ($('#wk-create-account').is(":checked")) {
                    var is_guest = 0;
                } else {
                    var is_guest = 1;
                }
                no_error = checkEmailExist(email, is_guest);

                if (no_error == true) {
                    var isValidated = validateDeliveryFormData(formData, dataType);
                    if (isValidated) {
                        wknewtoken = createAccount();
                        if (wknewtoken) {
                            //update token
                            wktoken = wknewtoken;
                            wk_is_logged = 1;
                            if (is_guest == 1) {
                                customer_is_guest = 1;
                            } else {
                                customer_is_guest = 0;
                            }
                        } else {
                            no_error = false;
                        }
                    } else {
                        no_error = false;
                    }
                }
            }
        } else {
            var isValidated = validateDeliveryFormData(formData, dataType);
            if (!isValidated) {
                no_error = false;
            }
        }

        if (no_error == true) {
            if (dataType == 'delivery') {
                var isUpdating = $('#id-new-delivery-address').val();
            } else {
                var isUpdating = $('#id-new-invoice-address').val();
            }
            var isCreated = createNewAddress(formData, dataType, true, true, false);
            if (typeof isUpdating !== 'undefined' && (isUpdating > 0)) {
                if (isCreated) {
                    wkShowSuccess(wk_add_updated);
                } else {
                    wkShowError(wk_add_upd_failed);
                }
            } else {
                if (isCreated) {
                    wkShowSuccess(wk_add_success);
                } else {
                    wkShowError(wk_add_failed);
                }
            }
            setTimeout(() => {
                window.location.reload();
            }, 1000);
        }
    });

    //	Add voucher code into input box
    $(document).on('click', '#wkadd-code', function () {
        $('#wk-voucher').attr('value', $(this).text());
    });

    // check if payment method is checked or not
    var paymentChecked = $('input[name=payment-option]:checked').attr('id');
    //$('#' + paymentChecked + '-additional-information').show();
    $('#' + paymentChecked + '-additional-information').css({ 'display': 'inline-block' });

    //	By selecting terms and condition make payment button enabled
    $(document).on('click', '.wk-condition-check', function () {
        if ($(this).is(':checked')) {
            $('#payment-confirmation button').removeAttr('disabled');
        } else {
            $('#payment-confirmation button').attr('disabled', 'disabled');
        }
    });

    // On quick view, proceed to checkout will reload the page on order controller
    $(document).on('click', 'div.cart-content-btn a', function (event) {
        event.preventDefault();
        window.location.href = wkorder;
    });

    // on quick view, if customer choose to continue shopping then redirect to home page
    $(document).on('click', 'div.cart-content-btn button', function (event) {
        window.location.href = wkhome;
    });

    // change image when customer open modal box to view product image in large size
    $(document).on('click', '.js-modal-thumb', function (event) {
        if ($('.js-modal-thumb').hasClass('selected')) {
            $('.js-modal-thumb').removeClass('selected');
        }
        $(event.currentTarget).addClass('selected');
        var idProduct = $(event.currentTarget).attr('data-id-product');
        $('.js-modal-product-cover-' + idProduct).attr('src', $(event.target).data('image-large-src'));
        $('.js-modal-product-cover-' + idProduct).attr('title', $(event.target).attr('title'));
        $('.js-modal-product-cover-' + idProduct).attr('alt', $(event.target).attr('alt'));
    });

    // Add product into cart when customer click on add to cart from below of cart page
    $(document).on('click', '[data-button-action="wk-add-to-cart"]', function (event) {
        var idProduct = $(this).attr('data-id-product');
        var idProductAttribute = $(this).attr('data-id-product-attribute');
        addProductIntoCart(idProduct, idProductAttribute);
    });

    // save cart when customer click on save cart icon from cart detail page
    $(document).on('click', '#wk-cart-save', function () {
        var obj = $(this);
        if (saveCart(obj, 'saveCartProduct', false, false)) {
            changeCartQuantity(obj, 'deleteCartProduct', false, false, false);
        }
    });

    // Final payment process
    $(document).on('click', '#payment-confirmation button', function (e) {
        e.preventDefault();
        var stepGuest = stepAddress = stepShipping = stepPayment = stepCustomer = true;
        if (wk_is_logged == 0) {
            stepGuest = validateGuestOrNewCustomer();
            if (!stepGuest) {
                $('html, body').animate({
                    scrollTop: ($('#wk-email').offset().top - 200)
                }, 2000);
                enableOrderButton();
                return false;
            }
        }

        stepAddress = validateCustomerAddress();
        if (!stepAddress) {
            $('html, body').animate({
                scrollTop: ($('#wk_delivery_first_name, #wk_invoice_first_name').offset().top - 80)
            }, 2000);
            enableOrderButton();
            return false;
        }

        stepOrderSummary = validateOrderSummary();

        if (!stepOrderSummary) {
            $('html, body').animate({
                scrollTop: ($('#wk-order-summary-ajax').offset().top - 80)
            }, 2000);
            enableOrderButton();
            return false;
        }

        stepShipping = validateShippingSelection();
        if (!stepShipping) {
            enableOrderButton();
            return false;
        }

        stepPayment = validatePaymentSelection();
        if (!stepPayment) {
            $('#wkpayment-error').show().text(wk_payment_err);
            $('html, body').animate({
                scrollTop: ($('.wk-payment-method').offset().top - 10)
            }, 2000);
            enableOrderButton();
            return false;
        }
        if (wk_is_logged == 0 && customer_is_guest == 0) {
            wknewtoken = createAccount();
            if (!wknewtoken) {
                enableOrderButton();
                return false;
            }
        }
        if (typeof wknewtoken === 'undefined') {
            wknewtoken = wktoken;
        }
        stepCustomer = createCustomerAddress(wknewtoken);
        if (!stepCustomer) {
            wkShowError(address_failed);
            enableOrderButton();
            return false;
        }

        var shippingMethodWithComma = $('input:radio.wk_selected_shipping:checked').val();
        var shippingMethod = removeCommaFromShipping(shippingMethodWithComma);
        if (typeof shippingMethod !== 'undefined') {
            stepCarrier = setDeliveryMethod(shippingMethod, false, false, wknewtoken);
            if (!stepCarrier) {
                $('#wkshipping-error').show().text(no_shipping_select); //	Shipping is not updated
                $('html, body').animate({
                    scrollTop: ($('.wk-shipping-carriers').offset().top - 10)
                }, 2000);
                enableOrderButton();
                return false;
            }
        }

        $('#wkpayment-error, #wkshipping-error').hide().text('');
        makePayment();
        return false;
    });

    $(document).on('click', '#wk-delivery-address-delete', function (e) {
        e.preventDefault();
        if (confirm(wk_add_delete_conf)) {
            var idAddress = $('#wk-existing-delivery-address').find('option:selected').val();
            if (idAddress) {
                deleteAddress(idAddress);
            }
        }
    });

    $(document).on('click', '#wk-invoice-address-delete', function (e) {
        e.preventDefault();
        if (confirm(wk_add_delete_conf)) {
            var idAddress = $('#wk-existing-invoice-address').find('option:selected').val();
            if (idAddress) {
                deleteAddress(idAddress);
            }
        }
    });

    $(document).on('click', '#wk-delivery-address-edit', function (e) {
        e.preventDefault();
        var idAddress = $('#wk-existing-delivery-address').find('option:selected').val();
        if (idAddress) {
            fillAddressDetails(idAddress, 'delivery');
        }
    });

    $(document).on('click', '#wk-invoice-address-edit', function (e) {
        e.preventDefault();
        var idAddress = $('#wk-existing-invoice-address').find('option:selected').val();
        if (idAddress) {
            fillAddressDetails(idAddress, 'invoice');
        }
    });

    $(document).on('click', '#wk-delivery-address-1', function () {
        showCustomerLoader();
        $('.wk-diff-address-delivery').html(wk_add_new_del);
        hideCustomerLoader();
    });

    $(document).on('click', '#wk-delivery-address-2', function () {
        resetAddressForm('delivery');
    });

    $(document).on('click', '#wk-invoice-address-1', function () {
        $('.wk-diff-address-invoice').html(wk_add_new_inv);
    });

    $(document).on('click', '#wk-invoice-address-2', function () {
        resetAddressForm('invoice');
    });

    $(document).on('click', '.toggle-pwd-field', function () {
        var iconName = $(this).find('i.material-icons').html();
        if (iconName == 'visibility') {
            $(this).find('i.material-icons').html('visibility_off');
            $('#wk-login-password').attr('type', 'text');
        } else {
            $(this).find('i.material-icons').html('visibility');
            $('#wk-login-password').attr('type', 'password');
        }
    });

    if (typeof noAddress !== 'undefined') {
        showNewDeliveryAddress(2);
    }
});

function wkShowError(msg) {
    $.growl.error({ title: "", message: msg });
}

function wkShowSuccess(msg) {
    $.growl.notice({ title: "", message: msg });
}

function validateGuestOrNewCustomer() {
    if (validateGuestEmail()) {
        var wk_day = $('select[name=wk_day]').val();
        var wk_month = $('select[name=wk_month]').val();
        var wk_year = $('select[name=wk_year]').val();

        if (typeof wk_day !== 'undefined' || typeof wk_month !== 'undefined' || typeof wk_year !== 'undefined') {
            if (wk_day == 0 && wk_month == 0 && wk_year == 0) {
                $('#wk_day').removeClass('border-error');
                $('#wk_month').removeClass('border-error');
                $('#wk_year').removeClass('border-error');
            } else if (wk_day > 0 && wk_month > 0 && wk_year > 0) {
                $('#wk_day').removeClass('border-error');
                $('#wk_month').removeClass('border-error');
                $('#wk_year').removeClass('border-error');
            } else if (!wk_day) {
                $('#wk_day').addClass('border-error');
                $('#wk_month').removeClass('border-error');
                $('#wk_year').removeClass('border-error');
                return false;
            } else if (!wk_month) {
                $('#wk_day').removeClass('border-error');
                $('#wk_month').addClass('border-error');
                $('#wk_year').removeClass('border-error');
                return false;
            } else if (!wk_year) {
                $('#wk_day').removeClass('border-error');
                $('#wk_month').removeClass('border-error');
                $('#wk_year').addClass('border-error');
                return false;
            } else {
                $('#wk_day').removeClass('border-error');
                $('#wk_month').removeClass('border-error');
                $('#wk_year').removeClass('border-error');
            }
        } else {
            $('#wk_day').removeClass('border-error');
            $('#wk_month').removeClass('border-error');
            $('#wk_year').removeClass('border-error');
        }

        var create_account = 0;
        if ($('#wk-create-account').is(":checked")) {
            var create_account = 1;
        }
        if (checkEmailExist($('#wk-email').val(), create_account)) {
            if (create_account) {
                if (validatePassword()) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return true;
            }
        } else {
            return false;
        }
    } else {
        return false;
    }
}

function validateGuestEmail() {
    $('#wk-email-error').text('');
    var email = $('#wk-email').val();
    email = email.split(' ').join('');
    $('#wk-email').val(email);
    if (!email) {
        $('#wk-email').addClass('border-error');
        $('#wk-email-error').text(email_required);
        $('.error_wk_email').show();
        $('html, body').animate({
            scrollTop: ($('#wk-email').offset().top - 200)
        }, 2000);
        return false;
    } else if (!ValidateEmail(email)) {
        $('#wk-email').addClass('border-error');
        $('#wk-email-error').text(email_error);
        $('.icon_wk_email').hide();
        $('.error_wk_email').show();
        $('html, body').animate({
            scrollTop: ($('#wk-email').offset().top - 200)
        }, 2000);
        return false;
    } else if (email.length > 128) {
        $('#wk-email').addClass('border-error');
        $('#wk-email-error').text(email_length);
        $('.icon_wk_email').hide();
        $('.error_wk_email').show();
        $('html, body').animate({
            scrollTop: ($('#wk-email').offset().top - 200)
        }, 2000);
        return false;
    } else if (!ValidateEmail(email)) {
        $('#wk-email').addClass('border-error');
        $('#wk-email-error').text(email_error);
        $('.icon_wk_email').hide();
        $('.error_wk_email').show();
        $('html, body').animate({
            scrollTop: ($('#wk-email').offset().top - 200)
        }, 2000);
        return false;
    } else {
        $('.error_wk_email').hide();
        $('.icon_wk_email').show();
        $('#wk-email').removeClass('border-error').addClass('border-success');
        return true;
    }
}

function validatePassword() {
    $('#wk-password').removeClass('border-error, border-success');
    $('.error_wk_password, .icon_wk_password').hide();
    var password = $('#wk-password').val();
    if (!password) {
        $('#wk-password').addClass('border-error');
        $('#wk-password-error').text(password_required);
        $('#wk-password-error').show();
        $('.error_wk_password').show();
        return false;
    } else if (password.length > 60) {
        $('#wk-password').addClass('border-error');
        $('#wk-password-error').text(password_length);
        $('.error_wk_password').show();
        return false;
    } else {
        $('#wk-password').removeClass('border-error').addClass('border-success');
        $('.error_wk_password').hide();
        $('.icon_wk_password').show();
        $('#wk-password-error').hide();
        return true;
    }
}

function checkEmailExist(email, create_account) {
    Window.error = false;
    $.ajax({
        type: 'POST',
        url: wkcheckout,
        // async: false,
        dataType: 'json',
        data: {
            'ajax': true,
            'email': email,
            'create_account': create_account,
            'action': 'checkEmail',
            'token': wktoken,
        },
        beforeSend: function () {
            showCustomerLoader();
        },
        complete: function () {
            hideCustomerLoader();
        },
        success: function (result) {
            if (result.status == 'ko') {
                $('#' + result.id).removeClass('border-success').addClass('border-error');
                $('#wk-email-error').html(result.msg);
                $('.icon_wk_email').hide();
                $('.error_wk_email').show();
                Window.error = true;
            } else {
                $('#wk-email').removeClass('border-error').addClass('border-success');
                $('.error_wk_email').hide();
                $('.icon_wk_email').show();
            }
        },
    });

    if (Window.error) {
        return false;
    }

    return true;
}

function validateCustomerAddress() {
    var selectedDeliveryAddress = $('input[name=wk-delivery-address]:checked').val();
    var selectedInvoiceAddress = $('input[name=wk-invoice-address]:checked').val();

    // checking delivery address
    if (typeof selectedDeliveryAddress === 'undefined') {
        var formData = $('#wk-delivery-form').serialize();
        var isDeliveryAddressValidated = validateDeliveryFormData(formData, 'delivery');
        if (!isDeliveryAddressValidated) {
            return false;
        }
    } else {
        if (selectedDeliveryAddress == 1) {
            var idDeliveryAddress = $('#wk-existing-delivery-address').val();
            if (typeof idDeliveryAddress === 'undefined') {
                wkShowError(delivery_adrs_not_select);
                return false;
            }
        } else if (selectedDeliveryAddress == 2) {
            var idDeliveryAddress = $('#id-new-delivery-address').val();
            if (typeof idDeliveryAddress === 'undefined') {
                var formData = $('#wk-delivery-form').serialize();
                var isDeliveryAddressValidated = validateDeliveryFormData(formData, 'delivery');
                if (!isDeliveryAddressValidated) {
                    return false;
                }
            }
        }
    }

    // checking invoice address
    if ($('input[name="wk-different-invoice"]').is(":checked")) {
        return true;
    } else {
        if (typeof selectedInvoiceAddress === 'undefined') {
            var formData = $('#wk-invoice-form').serialize();
            var isInvoiceAddressCreated = validateDeliveryFormData(formData, 'invoice');
            if (!isInvoiceAddressCreated) {
                return false;
            }
        } else {
            if (selectedInvoiceAddress == 1) {
                var idInvoiceAddress = $('#wk-existing-invoice-address').val();
                if (typeof idInvoiceAddress === 'undefined') {
                    wkShowError(invoice_not_created);
                    return false;
                }
            } else if (selectedInvoiceAddress == 2) {
                var idInvoiceAddress = $('#id-new-invoice-address').val();
                if (!idInvoiceAddress) {
                    var formData = $('#wk-invoice-form').serialize();
                    var isInvoiceAddressCreated = validateDeliveryFormData(formData, 'invoice');
                    if (!isInvoiceAddressCreated) {
                        return false;
                    }
                }
            }
        }
    }

    return true;
}

function validateOrderSummary() {
    Window.error = false;
    $.ajax({
        type: 'POST',
        url: wkcheckout,
        // cache: false,
        // async: false,
        dataType: 'json',
        data: {
            'ajax': true,
            'action': 'checkProductQuantity',
            'token': wktoken,
        },
        beforeSend: function () {
            showOrderSummaryLoader();
        },
        complete: function () {
            hideOrderSummaryLoader();
        },
        success: function (result) {
            if (!jQuery.isEmptyObject(result)) {
                $.each(result, function (i, item) {
                    if (item.status == 'ko') {
                        //$('.wkorder_error').show().append('<p>' + item.msg + '</p>');
                        $('.wkorder_error .wk-qty-error').remove();
                        $('.wkorder_error').show().append('<div class="col-md-12 alert alert-danger wk-qty-error">' + item.msg + '</div>');
                    }
                });
                Window.error = true;
            }
        },
        error: function () { },
    });
    if (Window.error) {
        return false;
    }
    return true;
}

// Create a function remove comma from shipping value
function removeCommaFromShipping(shippingMethod) {
    if (typeof shippingMethod !== "undefined") {
        return shippingMethod.replace(/\,/g, "");
    }
}

function validateShippingSelection() {
    // checking shipping method
    if ($('.wk-shipping-carriers').length == 0 || $('.wk-shipping-carriers').html() == "") {
        return true;
    }
    var shippingMethodWithComma = $('input:radio.wk_selected_shipping:checked').val();
    if (typeof shippingMethodWithComma === 'undefined') {
        wkShowError(no_shipping_select);
        return false;
    }
    var shippingMethod = removeCommaFromShipping(shippingMethodWithComma);
    if (typeof shippingMethod === 'undefined' && !wkvirtualcart) {
        wkShowError(no_shipping_select);
        return false;
    }

    return true;
}

function validatePaymentSelection() {
    // checking payment method
    var paymentMethod = $('input[name=payment-option]:checked').val();
    if (typeof paymentMethod === 'undefined') {
        return false;
    }

    return true;
}

function makePayment() {
    // adding prestashop payment button
    $('.wk_ps_payment_button').html('<div id="wk-payment-confirmation"><div class="ps-shown-by-js"><button type="submit" class="btn btn-primary center-block"></button></div></div>');

    // triggering click for prestashop payment button in order to proceed payment using prestashop method
    var paymentModule = $('input[name=payment-option]:checked').attr('data-module-name');
    if (paymentModule == 'stripepayment' || paymentModule == 'wkstripepayment') {
        user_email = $('#wk-email').val();
        $('.wk_ps_stripe').trigger('click');
    } else {
        $('#wk-payment-confirmation button').trigger('click');
    }
}

function createAccount() {
    var fname = $('#wk_delivery_first_name').val();
    var lname = $('#wk_delivery_last_name').val();
    var email = $('#wk-email').val();
    var pwd_req = false;
    var pswrd = '';
    if (wk_guest_allow == 1) {
        if ($('#wk-create-account').is(":checked")) {
            var create_account = 1;
            pswrd = $('#wk-password').val();
            pwd_req = true;
        } else {
            var create_account = 0;
        }
    } else {
        var create_account = 1;
        pswrd = $('#wk-password').val();
        pwd_req = true;
    }

    if (pwd_req && pswrd == '') {
        $('#wk-password').addClass('border-error');
        $('#wk-password-error').text(password_required);
        $('.error_wk_email').show();
        $('html, body').animate({
            scrollTop: ($('#wk-password').offset().top - 200)
        }, 2000);
        return false;
    }

    var social_title = $('input[name=id_gender]:checked').val();
    if (typeof social_title === 'undefined') {
        social_title = 0;
    }
    var wk_optin = $('input[name=wk-optin]:checked').val();
    if (typeof wk_optin === 'undefined') {
        wk_optin = 0;
    }
    var wk_newsletter = $('input[name=wk-newsletter]:checked').val();
    if (typeof wk_newsletter === 'undefined') {
        wk_newsletter = 0;
    }
    var wk_day = $('select[name=wk_day]').val();
    if (typeof wk_day === 'undefined') {
        wk_day = 0;
    }
    var wk_month = $('select[name=wk_month]').val();
    if (typeof wk_month === 'undefined') {
        wk_month = 0;
    }
    var wk_year = $('select[name=wk_year]').val();
    if (typeof wk_year === 'undefined') {
        wk_year = 0;
    }

    Window.idCustomer = false;
    $.ajax({
        type: 'POST',
        url: wkcheckout,
        async: false,
        data: {
            'ajax': true,
            'fname': fname,
            'lname': lname,
            'email': email,
            'password': pswrd,
            'social_title': social_title,
            'wk_optin': wk_optin,
            'wk_newsletter': wk_newsletter,
            'wk_day': wk_day,
            'wk_month': wk_month,
            'wk_year': wk_year,
            'action': 'createAccount',
            'create_account': create_account,
            'token': wktoken,
        },
        beforeSend: function () {
            showCustomerLoader();
        },
        complete: function () {
            hideCustomerLoader();
        },
        success: function (result) {
            if (result) {
                Window.idCustomer = result;
            }
        },
        error: function () { },
    });

    if (Window.idCustomer) {
        return Window.idCustomer;
    }

    return Window.idCustomer;
}

function createCustomerAddress(wknewtoken) {
    var selectedDeliveryAddress = $('input[name=wk-delivery-address]:checked').val();
    var selectedInvoiceAddress = $('input[name=wk-invoice-address]:checked').val();
    // checking delivery address
    if (typeof selectedDeliveryAddress === 'undefined') {
        var formData = $('#wk-delivery-form').serialize();
        isDeliveryAddressCreated = createNewAddress(formData, 'delivery', false, false, wknewtoken);
        if (!isDeliveryAddressCreated) {
            wkShowError(delivery_not_created);
            return false;
        }
    } else {
        if (selectedDeliveryAddress == 1) {
            var idDeliveryAddress = $('#wk-existing-delivery-address').val();
            if (typeof idDeliveryAddress === 'undefined') {
                wkShowError(delivery_adrs_not_select);
                return false;
            }
        } else if (selectedDeliveryAddress == 2) {
            var idDeliveryAddress = $('#id-new-delivery-address').val();
            if (typeof idDeliveryAddress === 'undefined') {
                var formData = $('#wk-delivery-form').serialize();
                isDeliveryAddressCreated = createNewAddress(formData, 'delivery', false, false, wknewtoken);
                if (!isDeliveryAddressCreated) {
                    wkShowError(delivery_not_created);
                    return false;
                }
            }
        }
    }

    // checking invoice address
    if ($('input[name="wk-different-invoice"]').is(":checked")) {
        if (typeof selectedDeliveryAddress === 'undefined') {
            var idInvoiceAddress = $('#id-new-delivery-address').val();
            if (typeof idInvoiceAddress === 'undefined') {
                wkShowError(invoice_adrs_not_select);
                return false;
            }
        } else {
            if (selectedDeliveryAddress == 1) {
                var idInvoiceAddress = idDeliveryAddress;
            } else {
                var idInvoiceAddress = $('#id-new-delivery-address').val();
            }

            if (!idInvoiceAddress) {
                wkShowError(invoice_adrs_not_select);
                return false;
            }
        }
    } else {
        if (typeof selectedInvoiceAddress === 'undefined') {
            var formData = $('#wk-invoice-form').serialize();
            isInvoiceAddressCreated = createNewAddress(formData, 'invoice', false, false, wknewtoken);
            if (!isInvoiceAddressCreated) {
                wkShowError(invoice_not_created);
                return false;
            }
        } else {
            if (selectedInvoiceAddress == 1) {
                var idInvoiceAddress = $('#wk-existing-invoice-address').val();
                if (typeof idInvoiceAddress === 'undefined') {
                    wkShowError(invoice_adrs_not_select);
                    return false;
                }
            } else if (selectedInvoiceAddress == 2) {
                var idInvoiceAddress = $('#id-new-invoice-address').val();
                if (!idInvoiceAddress) {
                    var formData = $('#wk-invoice-form').serialize();
                    isInvoiceAddressCreated = createNewAddress(formData, 'invoice', false, false, wknewtoken);
                    if (!isInvoiceAddressCreated) {
                        wkShowError(invoice_not_created);
                        return false;
                    }
                }
            }
        }
    }

    return true;
}

function validatePostalCode(fieldValue, fieldId, idCountry) {
    $.ajax({
        type: 'POST',
        url: wkcheckout,
        async: false,
        dataType: 'json',
        data: {
            'ajax': true,
            'fieldValue': fieldValue,
            'fieldId': fieldId,
            'idCountry': idCountry,
            'action': 'checkPostalCode',
            'token': wktoken,
        },
        beforeSend: function () {
            showCustomerLoader();
        },
        complete: function () {
            hideCustomerLoader();
        },
        success: function (result) {
            if (result.status == 'ko') {
                $('#' + fieldId).addClass('border-error').removeClass('border-success');
                $('.' + fieldId).html(result.msg);
                $('.icon_' + fieldId).addClass('wkhide').removeClass('wkshow');
                $('.error_' + fieldId).addClass('wkshow').removeClass('wkhide');
            } else {
                $('.' + fieldId).text('');
                $('#' + fieldId).removeClass('border-error').addClass('border-success');
                $('.icon_' + fieldId).addClass('wkshow').removeClass('wkhide');
                $('.error_' + fieldId).addClass('wkhide').removeClass('wkshow');
            }
        },
        error: function () { },
    });
}

function validateDeliveryFormData(formData, dataType) {
    Window.error = false;
    $.ajax({
        type: 'POST',
        url: wkcheckout,
        async: false,
        dataType: 'json',
        data: {
            'ajax': true,
            'formData': formData,
            'dataType': dataType,
            'action': 'validateDeliveryFormField',
            'token': wktoken,
        },
        beforeSend: function () {
            showCustomerLoader();
        },
        complete: function () {
            hideCustomerLoader();
        },
        success: function (result) {
            if (result) {
                $.each(result, function (i, item) {
                    if (item.status == 'ko') {
                        $('#' + item.id).addClass('border-error').removeClass('border-success');
                        $('.' + item.id).html(item.msg);
                        $('.icon_' + item.id).addClass('wkhide').removeClass('wkshow');
                        $('.error_' + item.id).addClass('wkshow').removeClass('wkhide');
                        $("a[href='#wk-existing-" + dataType + "']").trigger('click');
                    }
                });
                Window.error = true;
            }
        },
    });
    if (Window.error) {
        return false;
    }

    return true;
}

function createNewAddress(formData, dataType, updateShipping, updatePayment, wknewtoken) {
    if (typeof wknewtoken !== 'undefined') {
        if (wknewtoken) {
            wktoken = wknewtoken;
        }
    }
    Window.error = false;
    $.ajax({
        type: 'POST',
        url: wkcheckout,
        async: false,
        data: {
            'ajax': true,
            'formData': formData,
            'dataType': dataType,
            'action': 'createAddress',
            'token': wktoken,
        },
        beforeSend: function () {
            showCustomerLoader();
        },
        complete: function () {
            hideCustomerLoader();
        },
        success: function (result) {
            if (result) {
                if (dataType == 'delivery') {
                    $('#wk-delivery-address-form').html(result);
                    var idDeliveryAddress = $('#id-new-delivery-address').val();
                    if (typeof idDeliveryAddress === 'undefined') {
                        Window.error = true;
                    } else {
                        if ($('input[name="wk-different-invoice"]').is(":checked")) {
                            var idInvoiceAddress = idDeliveryAddress;
                        } else {
                            var idInvoiceAddress = $('#wk-existing-invoice-address').val();
                        }
                        updateCustomerAddress(
                            idDeliveryAddress,
                            idInvoiceAddress,
                            dataType,
                            updateShipping,
                            updatePayment
                        );
                    }
                } else {
                    $('#wk-invoice-address-form').html(result);
                    var idInvoiceAddress = $('#id-new-invoice-address').val();
                    if (typeof idInvoiceAddress === 'undefined') {
                        Window.error = true;
                    } else {
                        if ($('input[name="wk-delivery-address"]:checked').val() == 1) {
                            var idDeliveryAddress = $('#wk-existing-delivery-address option:selected').val();
                        } else {
                            var idDeliveryAddress = $('#id-new-delivery-address').val();
                        }
                        updateCustomerAddress(
                            idDeliveryAddress,
                            idInvoiceAddress,
                            dataType,
                            updateShipping,
                            updatePayment
                        );
                    }
                }
            } else {
                Window.error = true;
            }
        },
        error: function () { },
    });

    if (Window.error) {
        return false;
    }

    return true;
}

function validateAddressField(fieldValue, fieldId, fieldValidation, maxlength, required) {
    $.ajax({
        type: 'POST',
        url: wkcheckout,
        async: true,
        dataType: 'json',
        data: {
            'ajax': true,
            'fieldValue': fieldValue,
            'fieldId': fieldId,
            'fieldValidation': fieldValidation,
            'maxlength': maxlength,
            'required': required,
            'action': 'validateAddressField',
            'token': wktoken,
        },
        beforeSend: function () {
            showCustomerLoader();
        },
        complete: function () {
            hideCustomerLoader();
        },
        success: function (result) {
            if (result.status == 'ko') {
                $('#' + fieldId).addClass('border-error').removeClass('border-success');
                $('.' + fieldId).text(result.msg);
                $('.icon_' + fieldId).addClass('wkhide').removeClass('wkshow');
                $('.error_' + fieldId).addClass('wkshow').removeClass('wkhide');
            } else {
                $('.' + fieldId).text('');
                $('#' + fieldId).removeClass('border-error').addClass('border-success');
                $('.icon_' + fieldId).addClass('wkshow').removeClass('wkhide');
                $('.error_' + fieldId).addClass('wkhide').removeClass('wkshow');
            }
        },
        error: function () { },
    });
}

function updateCustomerAddress(idAddress, idAddressInvoice, address, updateShipping, updatePayment) {
    showCustomerLoader();
    $.ajax({
        type: 'POST',
        url: wkcheckout,
        cache: false,
        async: false,
        data: {
            'ajax': true,
            'action': 'changeAddressCard',
            'address': address,
            'idAddress': idAddress,
            'idAddressInvoice': idAddressInvoice,
            'token': wktoken,
        },
        beforeSend: function () {
            showCustomerLoader();
        },
        complete: function () {
            setTimeout(function () { hideCustomerLoader(); }, 300);
        },
        success: function (result) {
            if (address == 'delivery') {
                $('.wk-delivery-address-card').html(result);
            } else if (address == 'invoice') {
                $('.wk-invoice-address-card').html(result);
            }
            // $('#wkcustomer_info').html('');
            updateOrderSummary();
            if (updateShipping) {
                updateShippingMethod(0, 0, 0);
            } else {
                showShippingMethodLoader();
            }
            if (updatePayment) {
                updatePaymentMethod(1, false, false);
            } else {
                showPaymentMethodLoader();
            }
        },
        error: function () { },
    });
}

function setDeliveryMethod(idCarrier, idCountry, paymentupdate, wknewtoken) {
    if (typeof wknewtoken !== 'undefined') {
        if (wknewtoken) {
            wktoken = wknewtoken;
        }
    }
    $.ajax({
        type: 'POST',
        url: wkcheckout,
        async: false,
        data: {
            'ajax': true,
            'idCarrier': idCarrier,
            'action': 'setDeliveryOption',
            'token': wktoken,
        },
        beforeSend: function () {
            showShippingMethodLoader();
        },
        complete: function () {
            hideShippingMethodLoader();
        },
        success: function (result) {
            if (idCountry) {
                updateOrderSummary().then(function (ordersummaryresponse) {
                    if (ordersummaryresponse) {
                        updatePaymentMethod(0, idCountry, idCarrier);
                    }
                });
            } else {
                if (paymentupdate) {
                    updateOrderSummary().then(function (ordersummaryresponse) {
                        if (ordersummaryresponse) {
                            updatePaymentMethod(1, idCountry, false);
                        }
                    });
                }
            }
        },
        error: function () { },
    });
    return true;
}

function addVoucherOnCart(discountName) {
    $.ajax({
        type: 'POST',
        url: wkcheckout,
        // cache: false,
        // async: false,
        dataType: 'json',
        data: {
            'ajax': true,
            'action': 'addVoucher',
            'discountName': discountName,
            'token': wktoken,
        },
        beforeSend: function () {
            showOrderSummaryLoader();
        },
        complete: function () {
            hideOrderSummaryLoader();
        },
        success: function (result) {
            if (result.status == 'ok') {
                updateOrderSummary().then(function (ordersummaryresponse) {
                    if (ordersummaryresponse) {
                        updateShippingorPayment();
                    }
                });
            } else {
                $('.wkpromo-code').removeClass('wkhide').addClass('wkshow');
                $('.wkpromo-code span').text(result.msg);
            }
        },
    });
}

function deleteCartVoucher(idVoucher) {
    var deletecartvoucher = $.ajax({
        type: 'POST',
        url: wkcheckout,
        //cache: false, //only work correctly with HEAD and GET requests.
        //async: false,
        dataType: 'json',
        data: {
            'ajax': true,
            'action': 'deleteVoucher',
            'deleteDiscount': idVoucher,
            'token': wktoken,
        },
    });

    var deletecartvouchersuccess = function (result) {
        if (result.status == 'ok') {
            updateOrderSummary().then(function (ordersummaryresponse) {
                if (ordersummaryresponse) {
                    updateShippingorPayment();
                }
            });
        }
    }

    //@TODO::to set error

    deletecartvoucher.then(deletecartvouchersuccess);
}

function getStateByIdCountry(idCountry, dataAttr) {
    if (!updateAddrState) {
        return;
    }

    $.ajax({
        type: 'POST',
        url: wkcheckout,
        // cache: false,
        // async: false,
        data: {
            'ajax': true,
            'action': 'getState',
            'idCountry': idCountry,
            'dataAttr': dataAttr,
            'token': wktoken,
        },
        beforeSend: function () {
            showCustomerLoader();
        },
        complete: function () {
            hideCustomerLoader();
        },
        success: function (result) {
            if (dataAttr == 'delivery') {
                updateShippingMethod(1, idCountry, 0).then(function (updateshippingresponse) {
                    if (updateshippingresponse) {
                        updatePaymentMethod(0, idCountry, 0);
                    }
                });
                if (result) {
                    setTimeout(() => {
                        $('#wk-delivery-country-state').html(result);
                    }, 100);
                } else {
                    $('#wk-delivery-country-state').html('');
                }
            } else if (dataAttr == 'invoice') {
                if (result) {
                    setTimeout(() => {
                        $('#wk-invoice-country-state').html(result);
                    }, 100);
                } else {
                    $('#wk-invoice-country-state').html('');
                }
            }
        },
        error: function () { },
    });
}

function saveCart(obj, action, condition, currentQty) {
    Window.success = false;
    var idCustomization = 0;
    if (action == 'saveCartProduct') {
        var idProduct = obj.attr('data-id-product');
        var idProductAttribute = obj.attr('data-id-product-attribute');
        var idCustomization = obj.attr('data-id-customization');
        currentQty = obj.attr('data-quantity');
    }

    var saveCartAjax = $.ajax({
        type: 'POST',
        url: wkcheckout,
        cache: false,
        async: false,
        data: {
            'ajax': true,
            'action': action,
            'qty': currentQty,
            'operator': condition,
            'idProduct': idProduct,
            'idProductAttribute': idProductAttribute,
            'idCustomization': idCustomization,
            'token': wktoken,
        },
        beforeSend: function () {
            showOrderSummaryLoader();
        },
        complete: function () {
            hideOrderSummaryLoader();
            wkShowSuccess(saveSuccessMsg);
        },
    });

    var saveCartSuccess = function (result) {
        if (result) {
            Window.success = true;
        }
    };

    saveCartAjax.then(saveCartSuccess);
    return saveCartAjax;
    // if (Window.success) {
    //     return true;
    // }
    //
    // return false;
}

function changeCartQuantity(obj, action, condition, currentQty, changebyinput) {
    var changeQty = 0;
    var idProduct = obj.parent().siblings('input.wk-qty').attr('data-id-product');
    var idProductAttribute = obj.parent().siblings('input.wk-qty').attr('data-id-product-attribute');
    var idCustomization = obj.parent().siblings('input.wk-qty').attr('data-id-customization');

    if (action == 'deleteCartProduct') {
        var idProduct = obj.attr('data-id-product');
        var idProductAttribute = obj.attr('data-id-product-attribute');
        var idCustomization = obj.attr('data-id-customization');
    }

    if (changebyinput) {
        changeQty = 1;
        var idProduct = obj.attr('data-id-product');
        var idProductAttribute = obj.attr('data-id-product-attribute');
        var idCustomization = obj.attr('data-id-customization');
    }

    $.ajax({
        type: 'POST',
        url: wkcheckout,
        // cache: false,
        // async: false,
        data: {
            'ajax': true,
            'action': action,
            'qty': currentQty,
            'changeQty': changeQty,
            'operator': condition,
            'idProduct': idProduct,
            'idProductAttribute': idProductAttribute,
            'idCustomization': idCustomization,
            'token': wktoken,
        },
        beforeSend: function () {
            showOrderSummaryLoader();
        },
        complete: function () {
            hideOrderSummaryLoader();
        },
        success: function (result) {
            if (result == '0') {
                $('.wkorder_error').show().text(wk_no_longer);
            } else if (result == '2') {
                $('.wkorder_error').show().text(wk_no_stock);
            } else if (result == '3') {
                $('.wkorder_error').show().text(wk_minimum_qty);
            } else if (result == '4') {
                $('.wkorder_error').show().text(wk_max_qty);
            } else if (result == '5') {
                $('.wkorder_error').show().text(wk_update_qty_err);
            } else if (result == 6) {
                window.location.reload();
            } else if (result == 7) {
                // Nothing happend as no quantity change
            } else if (result) {

                if (isJsonString(result)) {
                    parsedJson = JSON.parse(result);
                    if (typeof parsedJson.hasError !== 'undefined' && parsedJson.hasError) {
                        if (parsedJson.errors.length) {
                            $.each(parsedJson.errors, function (i, v) {
                                $.growl.error({ title: "", message: v });
                            });
                            hideOrderSummaryLoader();
                            return false;
                        }
                    }
                } else {
                    $('.wkorder_error').hide().text('');
                    setTimeout(() => {
                        updateOrderSummary().then(function (ordersummaryresponse) {
                            if (ordersummaryresponse) {
                                updateShippingorPayment();
                            }
                        });
                    }, 100);
                    updateFooterBlock();
                    wkShowSuccess(deleteSuccessMsg)
                }
            } else {
                window.location.reload();
            }
        },
    });
}

function isJsonString(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}
function addProductIntoCart(idProduct, idProductAttribute) {
    $.ajax({
        type: 'POST',
        url: wkcart,
        cache: false,
        async: false,
        data: {
            'ajax': true,
            'action': 'update',
            'token': wktoken,
            'add': 1,
            'qty': 1,
            'id_product': idProduct,
            'id_customization': 0,
        },
        beforeSend: function () {
            //showOrderSummaryLoader();
        },
        complete: function () {
            //hideOrderSummaryLoader();
        },
        success: function (result) {
            if (result) {
                $('html, body').animate({
                    scrollTop: ($('#wk-one-page-checkout').offset().top)
                }, 2000, function () {
                    updateOrderSummary().then(function (ordersummaryresponse) {
                        if (ordersummaryresponse) {
                            updateShippingorPayment();
                        }
                    });
                    updateFooterBlock();
                });
            } else {
                window.location.reload();
            }
        },
        error: function () { },
    });
}

function updateFooterBlock() {
    $.ajax({
        type: 'POST',
        url: wkcheckout,
        cache: false,
        async: false,
        data: {
            'ajax': true,
            'action': 'updateFooter',
            'token': wktoken,
        },
        beforeSend: function () {

        },
        complete: function () {

        },
        success: function (result) {
            if (result) {
                $('.wk-products').html(result);
            } else {
                $('#wk-products').remove();
            }
        }
    });
}

function loginSubmit(action, info, condition) {
    $.ajax({
        type: 'POST',
        url: wkcheckout,
        // cache: false,
        // async: false,
        dataType: 'json',
        data: {
            ajax: true,
            action: action,
            params: info,
            'token': wktoken,
        },
        beforeSend: function () {
            if (condition == 'login') {
                $('.wk-loader').removeClass('wkhide').addClass('wkshowinline');
                $('#wk-submit-login').attr('disabled', 'disabled');
            }
        },
        complete: function () {
            if (condition == 'login') {
                $('.wk-loader').removeClass('wkshowinline').addClass('wkhide');
                $('#wk-submit-login').removeAttr('disabled');
            }
        },
        success: function (result) {
            if (result.status == 'ok') {
                window.location.reload();
            } else {
                $('.wk-login-error').text(result.msg).removeClass('wkhide').addClass('wkshow');
                $('#' + result.id).addClass('border-error');
            }
        },
        error: function () { },
    });
}

function changeLogin(val) {
    if (val == 1) { // Already Login Customers
        $('.wk-login-form').removeClass('wkhide').addClass('wkshow');
        $('.wk-guest-registration, .wk-delivery-address-form').removeClass('wkshow').addClass('wkhide');
    } else if (val == 2) { // Guest Customers
        $('.wk-login-form').removeClass('wkshow').addClass('wkhide');
        $('.wk-guest-registration, .wk-delivery-address-form').removeClass('wkhide').addClass('wkshow');
        $('#wk-registration-password').removeClass('wkshow').addClass('wkhide');
    } else if (val == 3) { // New Account Creation
        $('.wk-login-form').removeClass('wkshow').addClass('wkhide');
        $('.wk-guest-registration, .wk-delivery-address-form').removeClass('wkhide').addClass('wkshow');
        $('#wk-registration-password').removeClass('wkhide').addClass('wkshow');
    }
}

function showNewDeliveryAddress(condition) {
    if (condition == 1) {
        $('#wk-new-delivery').removeClass('wkshow').addClass('wkhide');
        $('#wk-existing-delivery-address').removeAttr('disabled');
        $('.wk-delivery-address-div').slideDown();

        var idAddress = $('#wk-existing-delivery-address option:selected').val();
        if ($('input[name="wk-different-invoice"]').is(":checked")) {
            var idAddressInvoice = idAddress;
        } else {
            var idAddressInvoice = $('#wk-existing-invoice-address option:selected').val();
        }
        updateCustomerAddress(idAddress, idAddressInvoice, 'delivery', true, true);
    } else if (condition == 2) {
        $('#wk-new-delivery').removeClass('wkhide').addClass('wkshow');
        $('#wk-existing-delivery-address').attr('disabled', 'disabled');
        $('.wk-delivery-address-div').slideUp();
        if (parseInt($('#id-new-delivery-address').val()) > 0) {
            updateAddrState = 0;
        } else {
            updateAddrState = 1;
        }
        var idCountry = $('.wk_address_country option:selected').val();
        getStateByIdCountry(idCountry, 'delivery');
    }
}

function showInvoiceAddress(condition) {
    if (condition == 1) {
        $('.wk-invoice-address-card').slideDown()
        $('#wk-new-invoice').removeClass('wkshow').addClass('wkhide');
        $('#wk-existing-invoice-address').removeAttr('disabled');
    } else if (condition == 2) {
        $('.wk-invoice-address-card').slideUp()
        $('#wk-new-invoice').removeClass('wkhide').addClass('wkshow');
        $('#wk-existing-invoice-address').attr('disabled', 'disabled');
    }
}

function updateOrderSummary() {
    var ordersummary = $.ajax({
        type: 'POST',
        url: wkcheckout,
        // cache: false,
        // async: false,
        data: {
            'ajax': true,
            'action': 'updateOrderSummary',
            'token': wktoken,
        },
        beforeSend: function () {
            showOrderSummaryLoader();
        },
        complete: function () {
            hideOrderSummaryLoader();
        },
    });

    var ordersummarysuccess = function (result) {
        if (result == 6) {
            window.location.reload();
        } else {
            $('#wk-order-summary-ajax').html(result);
            $('.wk-product-detail').addClass('js-product-miniature');
            compatibleWithPsMembership();
            compatibleWithWkProductTrial();
        }
    };

    ordersummary.then(ordersummarysuccess);

    return ordersummary;
}

function updateShippingMethod(newAddress, idCountry, idState) {
    if ($('#wk-msg-new-delivery'))
        var updateshippingajax = $.ajax({
            type: 'POST',
            url: wkcheckout,
            // async: false,
            // cache: false,
            data: {
                'ajax': true,
                'action': 'updateShipping',
                'newAddress': newAddress,
                'idCountry': idCountry,
                'idState': idState,
                'token': wktoken,
                'wk_is_logged': wk_is_logged
            },
            beforeSend: function () {
                showShippingMethodLoader();
            },
            complete: function () {
                hideShippingMethodLoader();
            },
        });

    var updateshippingsuccess = function (result) {
        if (wkvirtualcart) {
            $('.wk-shipping-carriers').html('');
        } else {
            $('.wk-shipping-carriers').html(result);
        }
    };

    updateshippingajax.then(updateshippingsuccess);
    return updateshippingajax;
}

function updatePaymentMethod(showPayment, idCountry, idCarrier) {
    $.ajax({
        type: 'POST',
        url: wkcheckout,
        // async: false,
        // cache: false,
        data: {
            'ajax': true,
            'action': 'updatePaymentMethod',
            'showPayment': showPayment,
            'idCountry': idCountry,
            'idCarrier': idCarrier,
            'token': wktoken,
            'wk_is_logged': wk_is_logged
        },
        beforeSend: function () {
            showPaymentMethodLoader();
        },
        complete: function () {
            hidePaymentMethodLoader();
        },
        success: function (result) {
if(result){
            $('.wk-payment-method').html(result);
};
            if (isPsCheckoutEnabled) {
                $('.ps_checkout-button').html('');
                if (typeof window.ps_checkout !== "undefined") {
                    setTimeout(() => {
                        window.ps_checkout.renderCheckout();
                        hideInactivePsCheckoutPayments();
                    }, 2000);
                }
            }
            if (isBraintreeOfficialEnabled) {
                setTimeout(() => {
                    initBraintreeCard();
                    if (use3dVerification == false) {
                        initBraintreeCvvField();
                    }
                }, 2000);
            }
        },
        error: function () { },
    });
}

function deleteAddress(idAddress) {
    if (idAddress) {
        $.ajax({
            type: 'POST',
            url: wkcheckout,
            data: {
                'ajax': true,
                'action': 'deleteAddress',
                'idAddress': idAddress,
                'token': wktoken,
            },
            beforeSend: function () {
                showCustomerLoader();
            },
            complete: function () {
                hideCustomerLoader();
            },
            success: function (result) {
                if (result) {
                    wkShowSuccess(wk_add_delete_success);
                    setTimeout(() => {
                        window.location.reload();
                    }, 1000);
                } else {
                    wkShowError(wk_add_delete_error);
                }
            },
            error: function () { },
        });
    }
}

function fillAddressDetails(idAddress, dataType) {
    if (idAddress) {
        $.ajax({
            type: 'POST',
            url: wkcheckout,
            data: {
                'ajax': true,
                'action': 'getAddressDetails',
                'idAddress': idAddress,
                'dataType': dataType,
                'token': wktoken,
            },
            beforeSend: function () {
                showCustomerLoader();
            },
            complete: function () {
                hideCustomerLoader();
            },
            success: function (result) {
                if (result) {
                    $('.wk-diff-address-' + dataType).html(wk_add_upd_text);
                    updateAddrState = 0;
                    if (dataType == 'delivery') {
                        $('#wk-delivery-address-form').html(result);
                        $('#wk-delivery-address-2').prop('checked', true);
                        $('#wk-delivery-address-2').trigger('change');
                    } else {
                        $('#wk-invoice-address-form').html(result);
                        $('#wk-invoice-address-2').prop('checked', true);
                        $('#wk-invoice-address-2').trigger('change');
                    }
                    if ($('[name="psgdpr_consent_checkbox"]').length) {
                        $('[name="psgdpr_consent_checkbox"]').attr('required', true);
                    }
                    if ($('[name="gdpr_agreement"]').length) {
                        $('[name="gdpr_agreement"]').prop('checked', true);
                        $('[name="gdpr_agreement"]').attr('required', true);
                    }

                } else {
                    console.log(result);
                }
            },
            error: function () { },
        });
    }
}

function resetAddressForm(dataType) {
    $.ajax({
        type: 'POST',
        url: wkcheckout,
        data: {
            'ajax': true,
            'action': 'resetAddressDetails',
            'dataType': dataType,
            'token': wktoken,
        },
        beforeSend: function () {
            showCustomerLoader();
        },
        complete: function () {
            hideCustomerLoader();
        },
        success: function (result) {
            if (result) {
                if (dataType == 'delivery') {
                    $('#wk-delivery-address-form').html(result);
                } else {
                    $('#wk-invoice-address-form').html(result);
                }

                if ($('[name="psgdpr_consent_checkbox"]').length) {
                    $('[name="psgdpr_consent_checkbox"]').attr('required', true);
                }
                if ($('[name="gdpr_agreement"]').length) {
                    if ($('.wk_gdpr_agreement').prop('checked') != true) {
                        $('.wk_gdpr_agreement').closest('form').find('[type="submit"]').attr('disabled', 'disabled');
                    }
                    $('[name="gdpr_agreement"]').attr('required', true);
                }
            } else {
                console.log(result);
            }
        },
        error: function () { },
    });
}

function showCustomerLoader() {
    $('#wkcustomer_info').html('<div class="wkloading_overlay"><div class="spinner"> <div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div></div>');
}

function hideCustomerLoader() {
    $('#wkcustomer_info').html('');
}

function showOrderSummaryLoader() {
    $('#wkorder-summary').html('<div class="wkloading_overlay"><div class="spinner"> <div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div></div>');
}

function hideOrderSummaryLoader() {
    $('#wkorder-summary').html('');
}

function showShippingMethodLoader() {
    $('#wkshipping-method').html('<div class="wkloading_overlay"><div class="spinner"> <div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div></div>');
}

function hideShippingMethodLoader() {
    $('#wkshipping-method').html('');
}

function showPaymentMethodLoader() {
    $('#wkpayment-method').html('<div class="wkloading_overlay"><div class="spinner"> <div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div></div>');
}

function hidePaymentMethodLoader() {
    $('#wkpayment-method').html('');
}

function showTermsNConditionLoader() {
    $('#wkcondition_info').html('<div class="wkloading_overlay"><div class="spinner" style="top:-115%;"> <div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div></div>');
}

function hideTermsNConditionLoader() {
    $('#wkcondition_info').html('');
}

function updateShippingorPayment() {
    if (wk_is_logged == 0) {
        var idCountry = $('select[name=wk_delivery_address_country] option:selected').val();
        if (typeof idCountry !== 'undefined') {
            updateShippingMethod(1, idCountry, 0).then(function (updateshippingresponse) {
                if (updateshippingresponse) {
                    updatePaymentMethod(0, idCountry, false);
                }
            });
        } else {
            updateShippingMethod(0, false, 0).then(function (updateshippingresponse) {
                if (updateshippingresponse) {
                    updatePaymentMethod(1, false, false);
                }
            });
        }
    } else {
        updateShippingMethod(0, false, 0).then(function (updateshippingresponse) {
            if (updateshippingresponse) {
                updatePaymentMethod(1, false, false);
            }
        });
    }
}

function ValidateEmail(email) {
    var check = /^\S+@\S+\.\S+$/;
    return check.test(email);
};

function hideInactivePsCheckoutPayments() {
    const paymentOptions = document.querySelectorAll('input[name="payment-option"]');
    if (null !== paymentOptions) {
        paymentOptions.forEach(function (paymentOption) {
            const paymentOptionContainer = document.getElementById(paymentOption.id + '-container');
            const paymentOptionName = paymentOption.getAttribute('data-module-name');
            if (-1 !== paymentOptionName.search('ps_checkout')) {
                paymentOptionContainer.style.display = 'none';
            }
        });
    }
}

function renderPsAddress(idCountry, dataAttr) {
    var idAddress = 0;
    var formData;
    if (dataAttr == 'delivery') {
        idAddress = $('#id-new-delivery-address').val();
        formData = $('#wk-delivery-form').serialize();
    } else if (dataAttr == 'invoice') {
        idAddress = $('#id-new-invoice-address').val();
        formData = $('#wk-invoice-form').serialize();
    }
    var addressForm = $.ajax({
        type: 'POST',
        url: wkcheckout,
        data: {
            'ajax': true,
            'token': wktoken,
            'action': 'getAddressForm',
            'idCountry': idCountry,
            'dataType': dataAttr,
            'idAddress': idAddress,
            'formData': formData
        },
        beforeSend: function () {
            showCustomerLoader();
        },
        complete: function () {
            hideCustomerLoader();
        }
    });

    var getAddressFormSuccess = function (result) {
        if (dataAttr == 'delivery') {
            $('#wk-delivery-address-form').replaceWith(result);
        } else if (dataAttr == 'invoice') {
            $('#wk-invoice-address-form').replaceWith(result);
        }
    };

    addressForm.then(getAddressFormSuccess);

    return addressForm;
}

function addPackRecyclablePack(addRecyclable) {
    if (id_cart) {
        $.ajax({
            type: 'POST',
            url: wkcheckout,
            async: false,
            data: {
                'ajax': true,
                'id_cart': id_cart,
                'id_customer': id_customer,
                'token': wktoken,
                'add_recyclable_pack': addRecyclable,
                'action': 'addPackRecyclablePack',
            },
            success: function (result) {
                console.log(result);
            },
        });
    }
}

function addGiftMessage(addGift) {
    if (id_cart) {
        $.ajax({
            type: 'POST',
            url: wkcheckout,
            async: false,
            data: {
                'ajax': true,
                'id_cart': id_cart,
                'id_customer': id_customer,
                'token': wktoken,
                'add_gift': addGift,
                'gift_message': $('#gift_message').val(),
                'action': 'addGiftMessage',
            },
            success: function (result) {
                if (result == '1') {
                    updateOrderSummary();
                } else {
                    wkShowError(invalid_gift_message);
                }
            },
        });
    }
}

function compatibleWithPsMembership() {
    if (typeof plan_product_id !== 'undefined') {
        var cart_all_div = $('.wk-qty');
        var product_id;
        $.each(cart_all_div, function (index, value) {
            product_id = $(value).attr('data-id-product');
            if (product_id == plan_product_id) {
                $(value).prop('readonly', true);
                $(value).siblings().hide();
            }
        });
    }
}
function compatibleWithWkProductTrial() {
    if (typeof isTrial !== 'undefined') {
        if (isTrial) {
            var cart_qty_input = $('.wk-qty');
            $.each(cart_qty_input, function (index, value) {
                $(value).prop('readonly', true);
                $.each($(value).siblings(), function (index1, value1) {
                    $(value1).hide();
                });
            });
        }
    }
}

$(document).on('change', '.wk-condition-check', function () {
    if ($(this).prop('checked') && !validateShippingSelection()) {
        $(this).prop('checked', false).trigger('change');
    }
});

function updateCartAddress() {
    var idAddress = $('#wk-existing-delivery-address option:selected').val();
    if ($('[name="wk-different-invoice"]').is(":checked")) {
        $('.wk-disabled-invoice').addClass('disabled');
        $('.wk-disabled-invoice a').removeAttr('data-toggle');
        $('#wk-existing-invoice').addClass('hidden');
        var idAddressInvoice = idAddress;
    } else {
        $('.wk-disabled-invoice').removeClass('disabled');
        $('.wk-disabled-invoice a').attr('data-toggle', 'tab');
        $('#wk-existing-invoice').removeClass('hidden');
        var idAddressInvoice = $('#wk-existing-invoice-address option:selected').val();
    }
    $('input[name="wk-invoice-address"]').click()
    updateCustomerAddress(idAddress, idAddressInvoice, 'delivery', true, true);
}
function enableOrderButton() {
    $('.wkcustomizerbtn').removeClass('wk_pointer_events_none');
    $('.wkcustomizerbtn').parent().removeClass('wk_cursor_not_allowed');
}
function disabledOrderButton() {
    $('.wkcustomizerbtn').addClass('wk_pointer_events_none');
    $('.wkcustomizerbtn').parent().addClass('wk_cursor_not_allowed');
}


