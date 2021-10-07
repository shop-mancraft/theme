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
<div id="_desktop_user_info" class="order-5">
<div class="ttuserheading flex items-center p-2 desktop:px-5">
  <svg class="inline-block mr-2" width="25px" height="25px" viewBox="0 0 8892 8892" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd" stroke-linejoin="round" stroke-miterlimit="2"><path d="M8128 7100.04C7814.592 5919.93 6941.22 4964.17 5808.83 4531.2c674.046-442.025 1119.99-1201.39 1119.99-2061.89C6928.82 1107.45 5814.31 0 4444.47 0 3074.58 0 1960.11 1107.45 1960.11 2469.31c0 860.496 445.892 1619.86 1119.99 2061.89C1651.6 5077.542 635.13 6455.77 635.13 8065.52v494.05c0 181.491 148.325 329.32 331.237 329.32h6956.21c182.908 0 331.233-147.829 331.233-329.32v-494.05c0-320.271-40.4-631.234-116.112-928.488-2.471-12.637-5.763-25.012-9.688-36.987zm-536.667 1130.34h-6293.75v-164.862c0-1724.18 1411.69-3127.16 3146.87-3127.16 1309.87 0 2435.28 799.688 2908.3 1933.22h-1252.08c-182.858 0-331.233 147.563-331.233 329.321 0 181.892 148.375 329.321 331.233 329.321h1444.3c30.321 173.908 46.308 352.608 46.308 535.296l.05 164.862h.008zm-3014.39-1358.8H4444.46c-182.913 0-331.238 147.563-331.238 329.321 0 181.892 148.325 329.321 331.238 329.321h132.483c182.908 0 331.233-147.429 331.233-329.321 0-181.758-148.275-329.321-331.233-329.321zm-1954.37-4402.25c0-998.475 817.333-1810.94 1821.89-1810.94 1004.6 0 1821.88 812.462 1821.88 1810.94 0 998.346-817.283 1810.54-1821.88 1810.54-1004.61 0-1821.89-812.192-1821.89-1810.54z" fill="#fff"/></svg>
  <span class="myaccount text-white">
    {l s='My account' d='Shop.Theme.Actions'}
  </span></div>
  <ul class="user-info">
    {if $logged}
      <li><a
        class="logout hidden-sm-down"
        href="{$logout_url}"
        rel="nofollow"
      >
        <i class="material-icons user">person_outline</i>
        <span class="hidden-sm-down">{l s='Sign out' d='Shop.Theme.Actions'}</span>
      </a></li>
      <li><a
        class="account"
        href="{$my_account_url}"
        title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}"
        rel="nofollow"
      >
        <i class="material-icons hidden-md-up logged user">person_outline</i>
        <span class="hidden-sm-down">{$customerName}</span>
      </a></li>
    {else}
      <li><a
        href="{$my_account_url}"
        title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}"
        rel="nofollow"
      >
        <i class="material-icons user">person_outline</i>
        <span>{l s='Sign in' d='Shop.Theme.Actions'}</span>
      </a></li>
    {/if}
    {hook h='displayTtCompareHeader'}
    {hook h='displayTtWishlistHeader'}
    
      <!-- FB sign up button -->
    
    {if !$logged}
    <li>
      <a onclick="fb_login();" class="profile-btn onclick-btn" title="{l s='Sign in with Facebook' mod='hifacebookconnect'}">
       {l s='Sign in with' d='Shop.Theme.Actions'} 
       <svg width="14" height="14" viewBox="0 0 18 34" fill="none" xmlns="http://www.w3.org/2000/svg">
       <path d="M14.6624 5.64542H17.7663V0.239417C17.2308 0.16575 15.3891 0 13.2443 0C3.42398 0 6.09581 11.1208 5.70481 12.75H0.764893V18.7935H5.70339V34H11.7582V18.7949H16.497L17.2492 12.7514H11.7568C12.0231 8.75075 10.6787 5.64542 14.6624 5.64542Z" fill="white"/>
       </svg>
      </a>
    </li>
    {/if}
    
      <!-- FB sign up button -->
    
  </ul>
</div>
