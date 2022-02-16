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
<div class="ps_languageselector cursor-pointer float-right text-center relative m-4 tablet-narrow:my-1 mx-2 tablet-narrow:mx-0 flex-auto">
  <div class="language-selector-wrapper">
    <span id="language-selector-label" class="hidden">{l s='Language:' d='Shop.Theme.Global'}</span>
    <div class="language-selector dropdown js-dropdown">
      <button data-toggle="dropdown" class="hidden tablet-narrow:block text-black hover:text-main p-2.5 my-[11px]" aria-haspopup="true" aria-expanded="false" aria-label="{l s='Language dropdown' d='Shop.Theme.Global'}">
        <span class="text-[19px] transition font-normal">{$current_language.name_simple}</span>
        <svg class="expand-icon" xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 0 24 24" width="24px" ><path d="M7.41 8.59L12 13.17l4.59-4.58L18 10l-6 6-6-6 1.41-1.41z"/></svg>
      </button>
      <ul class="dropdown-menu hidden-sm-down" aria-labelledby="language-selector-label">
        {foreach from=$languages item=language}
          <li>
            <a href="{url entity='language' id=$language.id_lang}" class="dropdown-item text-base font-normal transition {if $language.id_lang == $current_language.id_lang} current  text-main hover:text-main {else} text-gray-dark hover:text-black {/if} " data-iso-code="{$language.iso_code}">{$language.name_simple}</a>
          </li>
        {/foreach}
      </ul>
      <select class="link tablet-narrow:hidden appearance-none w-full tablet-narrow:w-auto" aria-labelledby="language-selector-label">
        {foreach from=$languages item=language}
          <option value="{url entity='language' id=$language.id_lang}"{if $language.id_lang == $current_language.id_lang} selected="selected"{/if} data-iso-code="{$language.iso_code}">
            {$language.name_simple}
          </option>
        {/foreach}
      </select>
    </div>
  </div>
</div>
