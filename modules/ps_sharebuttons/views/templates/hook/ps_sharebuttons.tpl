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

{block name='social_sharing'}
  {if $social_share_links}
    <div class="social-sharing">
      <span>{l s='Share' d='Shop.Theme.Actions'}</span>
      <ul style="display: flex;align-items: center;">
        {foreach from=$social_share_links item='social_share_link'}
          <li class="{$social_share_link.class} icon-gray" style="width: 32px;height: 32px;display: flex;align-items: center;justify-content: center;background-size: 24px 25px;"><a href="{$social_share_link.url}" class="text-hide" title="{$social_share_link.label}" target="_blank">{$social_share_link.label}</a></li>
        {/foreach}
      </ul>

      {literal}
      <!-- AddThis Button BEGIN -->
      <div class="addthis_toolbox addthis_default_style addthis_32x32_style" style="    display: flex;align-items: center;justify-content: center;">
        <a style="margin: 0 0 0 0.5rem;padding: 0;background-color: white;width: 32px;height: 32px;display: flex;align-items: center;justify-content: center;" class="addthis_button_instagram_follow">
          <svg style="display: block;width: 20px;height: 20px;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 409.61 409.61"><path d="M307.205 0h-204.8C46.09 0 .005 46.085.005 102.4v204.81c0 56.3 46.085 102.4 102.4 102.4h204.8c56.315 0 102.4-46.1 102.4-102.4V102.4c0-56.315-46.085-102.4-102.4-102.4zm68.265 307.21c0 37.632-30.612 68.265-68.265 68.265h-204.8c-37.637 0-68.265-30.633-68.265-68.265V102.4c0-37.642 30.628-68.265 68.265-68.265h204.8c37.653 0 68.265 30.623 68.265 68.265v204.81z" fill="#ACAAA6"/><circle cx="315.755" cy="93.865" r="25.6" fill="#ACAAA6"/><path d="M204.805 102.4c-56.566 0-102.4 45.839-102.4 102.4 0 56.54 45.834 102.41 102.4 102.41 56.55 0 102.4-45.87 102.4-102.41 0-56.561-45.85-102.4-102.4-102.4zm0 170.675c-37.699 0-68.265-30.566-68.265-68.275s30.566-68.265 68.265-68.265 68.265 30.556 68.265 68.265-30.566 68.275-68.265 68.275z" fill="#ACAAA6"/></svg>
        </a>
      </div>
      <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=xa-50c2b5376560dbbb"></script>
      <!-- AddThis Button END -->
      {/literal}
    </div>
  {/if}
{/block}
