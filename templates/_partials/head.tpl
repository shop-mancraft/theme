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

{* TW classes: whitespace-normal p-8 tablet-wide:p-[100px] pb-12 pt-16 phablet:px-8 tablet-narrow:px-16  py-10 tablet-wide:py-[100px] mb-7 w-20 max-w-2xl max-w-screen-phone-wide max-w-screen-tablet max-w-screen-tablet-narrow max-w-screen-phone duration-150 float-none p-4 rounded-xl mb-6 text-center pb-6 pb-8 w-0 w-4/5 mx-auto my-10 tablet:my-20 border-gray-dark phablet:px-8 tablet-narrow:px-16 phablet:hidden phablet:w-full tablet-wide:max-w-[1140px] tablet:p-5 tablet-wide:p-[100px] desktop:px-16 tablet:text-xl tablet:text-[40px] text-[#F0F0F0] tablet:mb-12 tablet:text-base max-h-[600px] tablet-narrow:px-28 desktop:px-28 tablet-narrow:max-w-screen-tablet tablet:text-3xl tablet-narrow:h-[500px] tablet-narrow:w-1/2 tablet-narrow:pb-20 tablet-narrow:pb-0 pb-20 desktop:mx-16 desktop:pl-16 max-h-[500px] tablet-narrow:items-end tablet-wide:py-[100px] tablet-wide:pt-[100px] *}

{block name='head_charset'}
  <meta charset="utf-8">
{/block}
{block name='head_ie_compatibility'}
  <meta http-equiv="x-ua-compatible" content="ie=edge">
{/block}

{block name='head_seo'}
  <title>{block name='head_seo_title'}{$page.meta.title}{/block}</title>
  <meta name="description" content="{block name='head_seo_description'}{$page.meta.description}{/block}">
  <meta name="keywords" content="{block name='head_seo_keywords'}{$page.meta.keywords}{/block}">
  {if $page.meta.robots !== 'index'}
    <meta name="robots" content="{$page.meta.robots}">
  {/if}
  {if $page.canonical}
    <link rel="canonical" href="{$page.canonical}">
  {/if}
  {if $page.page_name != 'product'}
    <meta property="og:image" content="{$urls.img_url}Mancraft_Featured_image.png">
  {/if}
   {block name='head_hreflang'}
      {foreach from=$urls.alternative_langs item=pageUrl key=code}
            <link rel="alternate" href="{$pageUrl}" hreflang="{$code}">
      {/foreach}
  {/block}
{/block}

{block name='head_viewport'}
  <meta name="viewport" content="width=device-width, initial-scale=1">
{/block}

  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Bai+Jamjuree:wght@200;500;600;700&display=swap" rel="stylesheet">

{block name='head_icons'}
  <link rel="icon" type="image/vnd.microsoft.icon" href="{$shop.favicon}?{$shop.favicon_update_time}">
  <link rel="shortcut icon" type="image/x-icon" href="{$shop.favicon}?{$shop.favicon_update_time}">
{/block}

{block name='stylesheets'}
  {include file="_partials/stylesheets.tpl" stylesheets=$stylesheets}
{/block}

{block name='javascript_head'}
  {include file="_partials/javascript.tpl" javascript=$javascript.head vars=$js_custom_vars}
{/block}

{block name='hook_header'}
  {$HOOK_HEADER nofilter}
{/block}

{block name='hook_extra'}{/block}
