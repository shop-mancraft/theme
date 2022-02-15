/**
* 2007-2021 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
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
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2021 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*
* Don't forget to prefix your containers with your own identifier
* to avoid any conflicts with others containers.
*/

 function fmmAddAllCart(){
            var coun = 0;
            $.each($("input[name='fmm_check']:checked"), function(){
                var id_product = $(this).val();
                coun = 1;
                var qty = $("#quantity_"+id_product).val();
                var group_aray = [];
                var ajax_url = $("#ajax_url").val();
                var group = $("#group_"+id_product).val();
                if (group == 0) {

                } else {
                    var i;
                    for (i = 1; i <= group; i++) {
                      var group_id = $(".fmm_option_"+id_product+"_"+i).val();
                      group_aray.push(group_id);
                    }
                }
                $.ajax({
                        url: ajax_url,
                        method: "post",
                        data: {
                          id_product: id_product,qty: qty,group_aray: group_aray, ajax:1, action: 'productAddToCart' 
                        },
                        dataType: "json",
                        success: function(data) {
                        }
                    });
                
            });
            if (coun == 1) {
                $('input:checkbox').removeAttr('checked'); 
                $.simplyToast('success', 'Products successfully added to your shopping cart');
            } else {
               $.simplyToast('warning', 'You need to select products first');
            }
 }

 $('#fmm_table').on('click', 'span.minus', function(e){
    var $input = $(this).parent().find('input');
                var count = parseInt($input.val()) - 1;
                count = count < 1 ? 1 : count;
                $input.val(count);
                $input.change();
                return false;
});

$('#fmm_table').on('click', 'span.plus', function(e){
    var $input = $(this).parent().find('input');
                $input.val(parseInt($input.val()) + 1);
                $input.change();
                return false;
});

  function fmmAddCart(id, group){
        var id_product = id;
        var ajax_url = $("#ajax_url").val();
        var qty = $("#quantity_"+id).val();
        var isint = $.isNumeric(qty);
        var error = 0;
        if (qty <= 0 || isint != true) {
            var error = 1;
            $.simplyToast('warning', 'Product is Not Available with this Quantity');
        }
        var group_aray = [];
        if (group == 0) {

        } else {
            var i;
            for (i = 1; i <= group; i++) {
              var group_id = $(".fmm_option_"+id+"_"+i).val();
              group_aray.push(group_id);
            }
        }
        if (error == 0) {
            $.ajax({
                url: ajax_url,
                method: "post",
                data: {
                  id_product: id_product,qty: qty,group_aray: group_aray, ajax:1, action: 'productAddToCart' 
                },
                dataType: "json",
                success: function(data) {
                  if (data==1) {
                    $.simplyToast('success', 'Product successfully added to your shopping cart');
                  } else if(data == 111) {
                    $.simplyToast('warning', 'Product is Not Available with this combination');
                  } else {
                    $.simplyToast('warning', 'Product is Not Available with this Quantity');
                  }
                },
                error: function() { 
                    $.simplyToast('warning', 'Product is Not Available with this Quantity');
                } 
            });
        }
    }


function getRelProducts(e) {
  var cat = [];
  $('input.tree:checkbox:checked').each(function () {
      cat.push($(this).val());
  });
  var ajax_url = $("#ajax_url").val();
  var search_q_val = $(e).val();
  //controller_url = controller_url+'&q='+search_q_val;
  if (typeof search_q_val !== 'undefined' && search_q_val) {
    $.ajax({
      type: 'GET',
      dataType: 'json',
      url: ajax_url + '&q=' + search_q_val + '&ajax=1&action=getSearchProducts&forceJson=1&disableCombination=0&exclude_packs=0&excludeVirtuals=0&limit=1&cat='+cat,
      success: function(data)
      {
        var quicklink_list ='<li class="rel_breaker" onclick="relClearData();"><i class="material-icons">&#xE14C;</i></li>';
        $.each(data, function(index,value){
          if (typeof data[index]['id'] !== 'undefined')
            quicklink_list += '<li onclick="relSelectThis('+data[index]['id']+','+data[index]['id_product_attribute']+',\''+data[index]['name']+'\',\''+data[index]['image']+'\',\''+data[index]['price']+'\');"><img src="' + data[index]['image'] + '" width="60"> ' + data[index]['name'] + '</li>';
        });
        if (data.length == 0) {
          quicklink_list = '';
        }
        $('#rel_holder').html('<ul>'+quicklink_list+'</ul>');
      },
      error : function(XMLHttpRequest, textStatus, errorThrown) {
        console.log(textStatus);
      }
    });
  }
  else {
    $('#rel_holder').html('');
  }
}

function relSelectThis(id, ipa, name, img, price) {
  if (ipa === undefined) {
    ipa = 0;
  }
  if ($('#row_' + id + '_' + ipa).length > 0) {
    showErrorMessage(error_msg);
  } else {
      var draw_html = '<li id="row_' + id + '" class="media"><div class="media-left"><img src="'+img+'" class="media-object image"></div><div class="media-body media-middle"><span class="label">'+name+'&nbsp;(PRICE:'+Math.round(price)+')<i onclick="relDropThis(this);" class="material-icons delete">clear</i><i onclick="relAddThis('+id+','+ipa+');"class="material-icons">add_shopping_cart</i><label style="margin-left: 5%;margin-right: 10px;color: #b1aaaa;">QTY</label><input class="qty_id" id="qty_'+id+'" type="number" value="1"></span></div><input type="hidden" value="'+id+','+ipa+'" name="related_products[]"><input type="hidden" value="'+ipa+'"  name="attr_related_products[]"></li>'
      $('#rel_holder_temp ul').append(draw_html);
  }
}

function relClearData() {
    $('#rel_holder').html('');
}
function relDropThis(e) {
    $(e).parent().parent().parent().remove();
}
function relAddThis(id_product,id_attr) {
    var qty = $("#qty_"+id_product).val();
    var isint = $.isNumeric(qty);
    if (qty <= 0 || isint != true) {
            $.simplyToast('warning', 'Product is Not Available with this Quantity');
            return 0;
        }
    var ajax_url = $("#ajax_url").val();
    $.ajax({
                url: ajax_url,
                method: "post",
                data: {
                  id_product: id_product,qty: qty,id_attr: id_attr, ajax:1, action: 'productAddToCartOne' 
                },
                dataType: "json",
                success: function(data) {
                    $.simplyToast('success', 'Product successfully added to your shopping cart');
                    $("#row_"+id_product).remove();
                },
                error: function() { 
                    $.simplyToast('warning', 'Product is Not Available with this Quantity');
                } 
            });

}

function textareaClick() {
    var ajax_url = $("#ajax_url").val();
    var texta = $("#csv_sku").val();
    $.ajax({
        url: ajax_url,
        method: "post",
        data: {
            texta: texta, ajax:1, action: 'productSku' 
        },
        dataType: "json",
        success: function(data) {
            if (data>0) {
                $.simplyToast('success', 'Product successfully added to your shopping cart');
                $('#csv_sku').val("");
            } else {
                $.simplyToast('warning', 'Product Information is not valid');
            }
            
        }
    });
}


$('#chkal').on( 'change', function() {
    if($(this).prop("checked") == true){
        $('input:checkbox').prop('checked',true);
    }else{
      $('input:checkbox').removeAttr('checked');
    }
  });
$('#chkal2').on( 'change', function() {
    if($(this).prop("checked") == true){
        $('input:checkbox').prop('checked',true);
    }else{
      $('input:checkbox').removeAttr('checked');
    }
  });
$('#chkal3').on( 'change', function() {
    if($(this).prop("checked") == true){
        $('input:checkbox').prop('checked',true);
    }else{
      $('input:checkbox').removeAttr('checked');
    }
  });

function changeAttr(id, group) {
        var id_product = id;
        var ajax_url = $("#ajax_url").val();
        var error = 0;
        var group_aray = [];
        if (group == 0) {

        } else {
            var i;
            for (i = 1; i <= group; i++) {
              var group_id = $(".fmm_option_"+id+"_"+i).val();
              group_aray.push(group_id);
            }
        }
        if (error == 0) {
            $.ajax({
                url: ajax_url,
                method: "post",
                data: {
                  id_product: id_product,group_aray: group_aray, ajax:1, action: 'productChangeAttr' 
                },
                dataType: "json",
                success: function(data) {
                    $("#price_"+id_product).text(data);
                }
            });
        }
}

 $('#cal').on( 'change', function() {
    if($(this).prop("checked") == true){
        $('input:checkbox').prop('checked',true);
    }else{
      $('input:checkbox').removeAttr('checked');
    }
  });


 $('div.dataTables_filter input').addClass('form-control');
$( document ).ready(function() {
        $('#fmm_table').DataTable({
        "lengthChange": false,
        "info":     false,
        responsive: {
          details:{
            display: $.fn.dataTable.Responsive.display.childRowImmediate,
          }
        },
        columnDefs: [
          { responsivePriority: -1, targets: 0 },
          { responsivePriority: -1, targets: 1 },
          { responsivePriority: 10001, targets: 2 }
          { responsivePriority: 10001, targets: -1 }
        ],
        "pageLength": noofrow
    });
         $("#fmm_table_paginate").hide();
    var content = '<i class="material-icons srcicon" tabindex="0" role="button">search</i>';
    $("#fmm_table_filter").append(content); 

    $('#fmm_table').DataTable()
});