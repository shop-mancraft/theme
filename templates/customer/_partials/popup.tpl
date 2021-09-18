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
 
<div id="popup_container">
    <div class="popup">
            <!-- To-do: change to img -->
        <div id="close_btn"></div>
        <div class="popup_main">
            <h2 class="popup_main-text">    Test.   </h2>
            <div class="popup_main-bar"></div>
        </div>
    </div>
</div>

    <style>

        @import url('https://fonts.googleapis.com/css2?family=Goldman&display=swap');

      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      h2{
          font-size: 25px;
      }

      #popup_container {
        position: fixed;
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100vw;
        height: 100vh;
        background: rgba(0,0,0,0.4);
        transition: opacity 0.3s ease-in-out;
      }

      .popup {
        position: relative;
        width: 600px;
        height: 417px;
        background: #000;
        border-radius: 15px;
        border:solid 2px #A8D727;
      }

      #close_btn {
        position: absolute;
        right: 20px;
        top: 20px;
        width: 12px;
        height: 12px;
        background: #f00;
      }

      .popup_main{
          display: flex;
          flex-direction: column;
          align-items: center;
      }

      .popup_main-text{
        margin-top: 50px;
        font-family: 'Goldman', 'Tahoma', 'sans-serif';
        font-weight: lighter;
        color: white;
        text-align: center;
        max-width: 467px;
      }

      .popup_main-bar{
          margin-top: 10px;
          height: 2px;
          width: 50px;
          background: #A8D727;
      }

    </style>

    <script>
        const btn = document.querySelector("#close_btn");
        const popup = document.querySelector("#popup_container");
      
        btn.addEventListener('click',function(){
            popup.style.opacity = "0";
            popup.addEventListener('transitionend',function(){
                popup.style.display = "none";
            })
        });

    </script>
      
