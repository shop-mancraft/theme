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


<div id="popup_container" style="display:none;">
    <div class="popup">
        <div id="close_btn">
            <i class="material-icons">close</i>
        </div>
        <div class="popup_main">
            <h2 class="popup_main-text">{l s='Accept the terms of Mancraft Loyalty program and collect points of each order.' d='Custom'}</h2>
            <div class="popup_main-bar"></div>
            <p class="popup_main-text">{l s='The points collected during the shopping can be exchanged for one of the unique rewards available for selection in the loyalty program panel.' d='Custom'}</p>
            <div class="popup_main-agree">
                <input type="checkbox" name="agree" id="agree">
                <label class="popup_main-text">{l s='I agree with the terms of the Mancraft Loyalty program, I want to collect free points for each product purchased and exchange them for great prizes.' d='Custom'}</label>
            </div>
            <div class="popup_main-btns">
                <button id="popup_main-btns-accept">{l s='Accept and join' d='Custom'}</button>
                <div class="popup_main-btns-more">
                    <a href="{l s='/en/content/41-rules-and-regulations-of-loyalty-program' d='Custom'}">{l s='Read more' d='Custom'}</a>
                    <div class="popup_main-bar"></div>
                </div>
            </div>
        </div>
    </div>
</div>
{literal}
    

<style>

    * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    }

    h2{
        font-size: 25px;
    }

    p{
        font-size: 14px;
    }

    #popup_container {
    position: fixed;
    display: flex;
    top: 0;
    left: 0;
    z-index: 999;
    justify-content: center;
    align-items: center;
    background: rgba(0,0,0,0.4);
    max-height: 100%;
    overflow: auto;
    width: 100%;
    height: auto;
    bottom: 0;
    }

    .popup {
    position: relative;
    padding: 10px;
    width: 600px;
    height: 450px;
    background: #0A0A0A;
    border-radius: 15px;
    border:solid 2px #A8D727;
    overflow: auto;
    max-height: 100%;
    }

    #close_btn {
    position: absolute;
    right: 20px;
    top: 20px;
    cursor: pointer;
    }

    .popup_main{
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .popup_main-text{
    margin-top: 40px;
    font-weight: lighter;
    color: #fff;
    text-align: center;
    max-width: 467px;
    }

    .popup_main-bar{
        margin-top: 10px;
        height: 2px;
        width: 50px;
        background: #A8D727;
    }

    .popup_main-agree{
        display: flex;
        margin-top: 40px;
    }

    .popup_main-agree .popup_main-text{
        font-size: 12px;
        max-width: 446px;
        margin: 0px;
        text-align: left;
    }

    .popup_main-agree input{
        width: 16px;
        height: 16px;
        margin: 0 20px 20px 0px;
    }

    .popup_main-agree input::before{
        display: block;
        content: '';
        box-sizing: border-box;
        width: 16px;
        height: 16px;
        border:1px solid #A8D727 ;
        border-radius: 2px;
    }

    .popup_main-btns{
    display: flex;
    justify-content: center;
    gap: 51px;
    flex-wrap: wrap;
    margin-top: 20px;
    }

    #popup_main-btns-accept{
        width: 179px;
        height: 50px;
        border: none;
        border-radius: 10px;
        background: #A8D727;
        font-family: 'Bai Jamjuree', 'Tahoma', 'sans-serif';
        font-weight: lighter;
        font-size: 15px;
        color: #fff;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    #popup_main-btns-accept:hover{
        background: #000;
    }

    .popup_main-btns-more{
        display: flex;
        position: relative;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    .popup_main-btns-more a{
        font-family: 'Bai Jamjuree', 'Tahoma', 'sans-serif';
        font-weight: lighter;
        font-size: 15px;
        line-height: 18px;
        text-decoration: none;
        color: #fff;
        transition: color 0.3s;
    }

    .popup_main-btns-more a:hover{
        color: #A8D727;
    }

    .popup_main-btns-more .popup_main-bar{
        position: absolute;
        background: #fff;
        width: 125px;
        height: 1px;
        margin-top: 29px;
    }


</style>
<script
src="https://code.jquery.com/jquery-3.6.0.min.js"
integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
crossorigin="anonymous"></script>
<script>
    function setCookie(key, value, expiry) {
        var expires = new Date();
        expires.setTime(expires.getTime() + (expiry * 24 * 60 * 60 * 1000));
        document.cookie = key + '=' + value + ';expires=' + expires.toUTCString();
    }

    function getCookie(key) {
        var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
        return keyValue ? keyValue[2] : null;
    }

    function eraseCookie(key) {
        var keyValue = getCookie(key);
        setCookie(key, keyValue, '-1');
    }


    (function($){
        $( document ).ready(function() {
            var ignoreLoyalty = getCookie('is_ignore_loyalty');
            if(ignoreLoyalty != 1){
                $.ajax({
                    method: "post",
                    url: "{/literal}{$link->getModuleLink('webo_loyaltypopup', 'ajax', array())}{literal}",
                    dataType: "json",
                    data:{
                        email: prestashop.customer.email,
                        token: prestashop.token
                    },
                    success: function (response) {
                        if(response['is_added'] && response['is_added'].length == 0){
                            $("#popup_container").show();
                        }
                    },
                });
            }

            $("#close_btn").on('click',function () {
                $("#popup_container").fadeOut(300);
                setCookie('is_ignore_loyalty', 1, 362);
            })

            $("#popup_main-btns-accept").on('click',function () {
                if($('#agree').prop('checked')){
                    $.ajax({
                        method: "POST",
                        url: "{/literal}{$link->getModuleLink('webo_loyaltypopup', 'ajax', array())}{literal}?action=add",
                        dataType: "json",
                        data:{
                            email: prestashop.customer.email,
                            loyalty_status: true,
                            token: prestashop.token
                        },
                        success: function (response) {
                            $("#popup_container").fadeOut(300);
                            alert("{/literal}{l s='Loyalty program activated!' d='Custom'}{literal}")
                        },
                    })
                }
            })
        });
    })(jQuery);
</script>
{/literal}