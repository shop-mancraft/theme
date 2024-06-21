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

$(document).on('click', '#wk-add-into-cart', function () {
    $(this).hide();
    var idProduct = $(this).attr('data-id-product');
    var idProductAttribute = $(this).attr('data-id-product-attribute');
    var idCustomization = $(this).attr('data-id-customization');
    var quantity = $(this).attr('data-quantity');
    if (idProduct) {
        $.ajax({
            type: 'POST',
            url: wkmycart,
            cache: false,
            async: false,
            data: {
                'ajax': true,
                'action': 'processChangeProductInCart',
                'token': wktoken,
                'add': 1,
                'qty': quantity,
                'id_product': idProduct,
                'idProductAttribute': idProductAttribute,
                'idCustomization': idCustomization,
            },
            beforeSend: function () {
                $('#wk-cart-loader').show();
            },
            complete: function () {
                $('#wk-cart-loader').hide();
            },
            success: function (result) {
                if (result == '1') {
                    window.location.href = wkorder;
                } else if (result == '0') {
                    wkShowError(wkNoLongerMsg);
                    return false;
                } else if (result == '2') {
                    wkShowError(wkOutofStockMsg);
                    return false;
                } else if (result == '3') {
                    wkShowError(wkAddMsg);
                    return false;
                } else if (result == '4') {
                    wkShowError(wkMaxMsg);
                    return false;
                }
            },
            error: function () {
                $(this).show();
            },
        });
    }
});

function wkShowError(msg) {
    $.growl.error({ title: "", message: msg });
}

function wkShowSuccess(msg) {
    $.growl.notice({ title: "", message: msg });
}

$(document).on('click', '#wk-delete-cart', function () {
    var idProduct = $(this).attr('data-id-product');
    var idProductAttribute = $(this).attr('data-id-product-attribute');
    $('#wk-cart-loader-' + idProduct + '-' + idProductAttribute).show();
});

$(document).on('click', '.wk-cart-save', function () {
    var obj = $(this);
    var idProduct = obj.attr('data-id-product');
    var idProductAttribute = obj.attr('data-id-product-attribute');
    var idCustomization = obj.attr('data-id-customization');
    currentQty = obj.attr('data-quantity');
    $.ajax({
        type: 'POST',
        url: wkcheckout,
        cache: false,
        async: false,
        data: {
            'ajax': true,
            'action': 'saveCartProduct',
            'qty': currentQty,
            'operator': false,
            'idProduct': idProduct,
            'idProductAttribute': idProductAttribute,
            'idCustomization': idCustomization,
            'token': wktoken,
        },
        success: function (result) {
            wkShowSuccess(saveSuccessMsg);
            changeCartQuantity(obj);
        }
    });
});

function changeCartQuantity(obj) {
    var idProduct = obj.attr('data-id-product');
    var idProductAttribute = obj.attr('data-id-product-attribute');
    var idCustomization = obj.attr('data-id-customization');

    $.ajax({
        type: 'POST',
        url: wkcheckout,
        data: {
            'ajax': true,
            'action': 'deleteCartProduct',
            'qty': false,
            'changeQty': false,
            'operator': false,
            'idProduct': idProduct,
            'idProductAttribute': idProductAttribute,
            'idCustomization': idCustomization,
            'token': wktoken,
        },
        success: function (result) {
            setTimeout(function () {
                window.location.reload();
            }, 500);
        },
    });
}

$(document).on('click', '.wk-add-into-cart', function () {
    $(this).hide();
    var idProduct = $(this).attr('data-id-product');
    var idProductAttribute = $(this).attr('data-id-product-attribute');
    var idCustomization = $(this).attr('data-id-customization');
    var quantity = $(this).attr('data-quantity');
    if (idProduct) {
        $.ajax({
            type: 'POST',
            url: wkmycart,
            cache: false,
            async: false,
            data: {
                'ajax': true,
                'action': 'processChangeProductInCart',
                'token': wktoken,
                'add': 1,
                'qty': quantity,
                'id_product': idProduct,
                'idProductAttribute': idProductAttribute,
                'idCustomization': idCustomization,
            },
            success: function (result) {
                if (result == '1') {
                    window.location.reload();
                } else if (result == '0') {
                    wkShowError(wkNoLongerMsg);
                    return false;
                } else if (result == '2') {
                    wkShowError(wkOutofStockMsg);
                    return false;
                } else if (result == '3') {
                    wkShowError(wkAddMsg);
                    return false;
                } else if (result == '4') {
                    wkShowError(wkMaxMsg);
                    return false;
                }
            },
            error: function () {
                $(this).show();
            },
        });
    }
});

$(document).on('click', '.wk-delete-from-saved-cart', function () {
    $(this).hide();
    var savedCartId = $(this).data('saved-cart-id');
    if (savedCartId) {
        $.ajax({
            type: 'POST',
            url: wkmycart,
            cache: false,
            async: false,
            data: {
                'ajax': true,
                'action': 'deleteFromSavedCart',
                'token': wktoken,
                'is_delete': 1,
                'saved_cart_id': savedCartId
            },
            success: function (result) {
                if (result == '1') {
                    setTimeout(function () {
                        wkShowSuccess(savedCartDeleteMesssage);
                        window.location.reload();
                    }, 500);
                } else {
                    $(this).hide();
                }
            }
        });
    }
});