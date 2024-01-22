{**
 * 2007-2020 PrestaShop and Contributors
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
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<div class="product-variants" id="variants">
  {foreach from=$groups key=id_attribute_group item=group}
    {if !empty($group.attributes)}
      <div class="clearfix product-variants-item">
        <span class="control-label !text-base text-[#BDBDBD] !mb-2">{$group.name}</span>
        {if $group.group_type == 'select'}

          <div id="group_{$id_attribute_group}" class="select-collapsible relative w-full float-left">
            <a data-toggle="collapse" href="#collapse-{$id_attribute_group}" role="button" aria-expanded="false"
              aria-controls="collapse-{$id_attribute_group}"
              class="transition-all float-left w-full variant-select-toggle border border-[#4F4F4F] rounded-[5px] block hover:!text-white text-base text-white whitespace-nowrap text-ellipsis pl-6 py-3 pr-10">
              {foreach from=$group.attributes key=id_attribute item=group_attribute}
                {if $group_attribute.selected}
                {$group_attribute.name} {/if}
              {/foreach}
            </a>
            <svg class="absolute right-5 top-[25px] " xmlns="http://www.w3.org/2000/svg" width="8" height="6"
              viewBox="0 0 8 6" fill="none">
              <path fill-rule="evenodd" clip-rule="evenodd"
                d="M7.01317 0.882095L4.0003 3.90137L0.987427 0.882094C0.761021 0.656489 0.394609 0.656489 0.169804 0.882094C-0.0566015 1.1085 -0.0566016 1.47571 0.169804 1.70212L3.57869 5.119C3.69469 5.235 3.8475 5.2902 4.0003 5.287C4.1523 5.2902 4.30511 5.235 4.42111 5.119L7.8308 1.70212C8.0564 1.47571 8.0564 1.1085 7.8308 0.882095C7.60439 0.656489 7.23878 0.656489 7.01317 0.882095Z"
                fill="#E0E0E0" />
            </svg>
            <ul
              class="collapse absolute left-0 right-0 top-full z-[999] float-left w-full border border-[#4F4F4F] rounded-[5px] !rounded-t-none overflow-hidden"
              id="collapse-{$id_attribute_group}">
              {foreach from=$group.attributes key=id_attribute item=group_attribute}
                <li class="!mr-0">
                  <label>
                    <input class="hidden peer" type="radio" data-product-attribute="{$id_attribute_group}"
                      name="group[{$id_attribute_group}]" value="{$id_attribute}" {if $group_attribute.selected}
                      checked="checked" {/if}>
                    <span
                      class="w-full text-left cursor-pointer text-white block px-6 py-3 bg-gray-blackish hover:bg-gray-normal peer-checked:bg-gray-normal transition">{$group_attribute.name}</span>
                  </label>
                </li>
              {/foreach}
            </ul>
          </div>

          {* <select class="form-control form-control-select" id="group_{$id_attribute_group}"
            data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <option value="{$id_attribute}" title="{$group_attribute.name}" {if $group_attribute.selected} selected="selected"
                {/if}>{$group_attribute.name}</option>
            {/foreach}
          </select> *}

        {elseif $group.group_type == 'color'}
          <ul id="group_{$id_attribute_group}">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <li class="float-xs-left input-container mb-2.5">
                <label>
                  <input class="peer hidden" type="radio" data-product-attribute="{$id_attribute_group}"
                    name="group[{$id_attribute_group}]" value="{$id_attribute}" {if $group_attribute.selected} checked="checked"
                    {/if}>
                  <span
                    class="block border border-[#4F4F4F] rounded-[5px] overflow-hidden peer-checked:!border-main hover:border-[#87ac20] w-[72px] h-[54px] desktop:w-20 desktop:h-[60px] transition duration-200 cursor-pointer "
                    {if $group_attribute.html_color_code && !$group_attribute.texture}
                      style="background-color: {$group_attribute.html_color_code}" {/if} {if $group_attribute.texture}
                    style="background-image: url({$group_attribute.texture})" {/if}>
                    {if $group_attribute.html_color_code && !$group_attribute.texture}
                      {foreach from=$combinations key=id_combination item=combination}
                        {if $combination['attributes_values'][$id_attribute_group] == $group_attribute.name && $combination['id_image'] > -1}
                          <img class="w-full h-full object-cover bg-black"
                            src="{$link->getImageLink($product->link_rewrite, $combination['id_image'], 'small_default')|escape:'htmlall':'UTF-8'}">
                          {break}
                        {/if}
                      {/foreach}
                    {/if}
                    <span class="sr-only">{$group_attribute.name}</span>
                  </span>
                </label>
              </li>
            {/foreach}
          </ul>
        {elseif $group.group_type == 'radio'}
          <ul id="group_{$id_attribute_group}">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <li class="input-container float-xs-left">
                <label>
                  <input class="input-radio" type="radio" data-product-attribute="{$id_attribute_group}"
                    name="group[{$id_attribute_group}]" value="{$id_attribute}" {if $group_attribute.selected} checked="checked"
                    {/if}>
                  <span class="radio-label">{$group_attribute.name}</span>
                </label>
              </li>
            {/foreach}
          </ul>
        {/if}
      </div>
    {/if}
  {/foreach}
</div>