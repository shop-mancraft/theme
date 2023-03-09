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
{block name='order_messages_table'}
  {if $order.messages}
    <div class="box messages">
      <h3>{l s='Messages' d='Shop.Theme.Customeraccount'}</h3>
      {foreach from=$order.messages item=message}
        <div class="message row">
          <div class="col-sm-4">
            {$message.name}<br/>
            {$message.message_date}
          </div>
          <div class="col-sm-8">
            {$message.message nofilter}
          </div>
        </div>
      {/foreach}
    </div>
  {/if}
{/block}

{block name='order_message_form'}
  {if $shop.email}
  <section class="order-message-form box">
    <p class="mb-4">{l s='If you have any questions regarding your order, please contact us by e-mail: [1] kontakt@mancraft.com [/1] or write to us via chat.' 
    sprintf=[
      "[1]" => ("<a href='mailto:%s'>", $shop.email),
      "[/1]" => "</a>"
      ] 
      d='Shop.Theme.Customeraccount'}
      </p>
    <p>{l s='Best regards, %nl Mancraft team.' sprintf=["%nl" => "<br>"] d='Shop.Theme.Customeraccount'}</p>
  </section>
  {/if}
{/block}
