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

<<<<<<< HEAD
 
{if $page.page_name == 'index'}
{if $homeslider.slides}
  <div data-banner-swiper class="swiper relative overflow-hidden" data-interval="{$homeslider.speed}" data-slides-length="{$homeslider.slides|@count}" >
  <div class="swiper-wrapper">
      {foreach from=$homeslider.slides item=slide name='homeslider'}
        {if $smarty.foreach.homeslider.iteration % 2 == 1}
          {assign var="nextSlide" value=$homeslider.slides[$smarty.foreach.homeslider.iteration]}
          {if 
            isset($nextSlide) 
            && $nextSlide.url|replace:'http://':'' ne 'none' && $nextSlide.url|replace:'http://':'' ne '/' && $nextSlide.url|replace:'http://':'' ne '' && $nextSlide.url ne 'https://'
            && $slide.url|replace:'http://':'' ne 'none' && $slide.url|replace:'http://':'' ne '/' && $slide.url|replace:'http://':'' ne '' && $slide.url ne 'https://'
          }
            <div class="swiper-slide w-full " >
              <a class="w-full hidden tablet:block" href="{$urls.base_url}{$slide.url|replace:'http:///':''}">
                <img 
                  class="object-cover w-full h-auto" 
                  width="1920" height="720"
                  src="{$slide.image_url}" alt="{$slide.legend|escape}">
              </a>
              <a class="w-full block tablet:hidden" href="{$urls.base_url}{$nextSlide.url|replace:'http:///':''}">
              <img 
                width="768" height="375"
                class="object-cover w-full h-[375px]" 
                src="{$nextSlide.image_url}" alt="{$nextSlide.legend|escape}">
            </a>
            </div>
          {elseif $slide.url|replace:'http://':'' ne 'none' && $slide.url|replace:'http://':'' ne '/' && $slide.url|replace:'http://':'' ne '' && $slide.url ne 'https://' }
              <div class="swiper-slide w-full" >
              <a class="w-full" href="{$urls.base_url}{$slide.url|replace:'http:///':''}">
                <img 
                  class="object-cover w-full h-[375px] tablet:h-auto" 
                  width="1920" height="720"
                  src="{$slide.image_url}" alt="{$slide.legend|escape}">
              </a>
            </div>
          {/if} 
        {/if}
      {/foreach}
      </div>
      <div class="banner-swiper-prev carousel-control left" role="button">
        <span class="icon-prev hidden-xs" aria-hidden="true">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <path d="M15.41 7.41 14 6l-6 6 6 6 1.41-1.41L10.83 12z"/>
          </svg>
        </span>
        <span class="sr-only">{l s='Previous' d='Shop.Theme.Global'}</span>
      </div>
      <div class="banner-swiper-next carousel-control right" role="button">
        <span class="icon-next" aria-hidden="true">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <path d="M10 6 8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"/>
          </svg>
        </span>
        <span class="sr-only">{l s='Next' d='Shop.Theme.Global'}</span>
      </div>
  </div>
{/if}
{/if}
=======
 {assign var="firstLoop" value=true}

 {if $page.page_name == 'index'}
 {if $homeslider.slides}
   <div id="carousel" data-ride="carousel" class="carousel slide homeslider col-sm-12" data-interval="{$homeslider.speed}" data-wrap="{(string)$homeslider.wrap}" data-pause="{$homeslider.pause}">
   <div class="row">
     <ul class="carousel-inner" role="listbox">
       {foreach from=$homeslider.slides item=slide name='homeslider'}
         {if $slide.url}
           <li class="carousel-item {if $firstLoop}active{/if}" role="option" aria-hidden="{if $smarty.foreach.homeslider.first}false{else}true{/if}">
             <a href="{$slide.url}">
               <figure>
                 <img width="1920" height="720" src="{$slide.image_url}" alt="{$slide.legend|escape}">
                 {if $slide.title || $slide.description}
                   <figcaption class="caption">
                     <h2 class="display-1 text-uppercase">{$slide.title}</h2>
                     <div class="caption-description">{$slide.description nofilter}</div>
                   </figcaption>
                 {/if}
               </figure>
             </a>
           </li>
           {assign var="firstLoop" value=false}
         {/if}
       {/foreach}
     </ul>
     <div class="direction" aria-label="{l s='Carousel buttons' d='Shop.Theme.Global'}">
       <a class="left carousel-control" href="#carousel" role="button" data-slide="prev">
         <span class="icon-prev hidden-xs" aria-hidden="true">
           <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
             <path d="M15.41 7.41 14 6l-6 6 6 6 1.41-1.41L10.83 12z"/>
           </svg>
         </span>
         <span class="sr-only">{l s='Previous' d='Shop.Theme.Global'}</span>
       </a>
       <a class="right carousel-control" href="#carousel" role="button" data-slide="next">
         <span class="icon-next" aria-hidden="true">
           <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
             <path d="M10 6 8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"/>
           </svg>
         </span>
         <span class="sr-only">{l s='Next' d='Shop.Theme.Global'}</span>
       </a>
     </div>
   </div>
   </div>
 {/if}
 {/if}
>>>>>>> MCHD-17
