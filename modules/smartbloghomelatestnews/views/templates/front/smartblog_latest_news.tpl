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

{assign var="tt_cnt" value="1"}
{assign var="tt_total" value="0"}
 {foreach from=$view_data item=post}
	{$tt_total = $tt_total+1}
{/foreach}

<div id="smartblog_block" class="block products_block  clearfix bottom-to-top hb-animate-element">
  <div class="container">
    <div class="products_block_inner">
      {if isset($smartshowhometitle) && $smartshowhometitle}
        <div class="tt-titletab">
          <h2 class="homepage-heading">
            <a href="{smartblog::GetSmartBlogLink('smartblog')}" class="tt-title">{l s='Assembly guide' d='Shop.Theme.Global'}</a>
          </h2>
        </div>
		    
        <p class="text-left mb-3">{l s='Learn reliable, airsoft assembly and installation tricks with Mancraft specialists.' d='Shop.Theme.Global'}</p>

        {if $tt_total > 3}
          <div class="customNavigation">
            <a class="btn prev ttblog_prev">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="width: 22px;margin: 3px 2px;">
                <path d="M0 0h24v24H0V0z" fill="none"></path>
                <path d="M15.41 16.59 10.83 12l4.58-4.59L14 6l-6 6 6 6 1.41-1.41z" fill="#fff"></path>
              </svg>
            </a>
            <a class="btn next ttblog_next">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="width: 22px;margin: 3px 2px;">
                <path d="M0 0h24v24H0V0z" fill="none"></path>
                <path d="M8.59 16.59 13.17 12 8.59 7.41 10 6l6 6-6 6-1.41-1.41z" fill="#fff"></path>
              </svg>
            </a>
          </div>
        {/if}

      {/if}
      <div class="sdsblog-box-content block_content">
      {if isset($view_data) AND !empty($view_data)}
        {assign var='i' value=1}
        <div id="smartblog-carousel" class="owl-carousel product_list">
          {foreach from=$view_data item=post}
            {assign var="options" value=null}
            {$options.id_post = $post.id}
            {$options.slug = $post.link_rewrite}
              <div class="item sds_blog_post">
                <div class="blog_post col-sm-12">
                  <div class="news_module_image_holder">
                    <a href="{smartblog::GetSmartBlogLink('smartblog_post',$options)}">
                      <img alt="{$post.title}" class="feat_img_small" src="{$link->getMediaLink($smart_module_dir)}/smartblog/views/img/{$post.post_img}-home-default.jpg" width="370" height="240">
                      <span class="blog-hover"></span>
                    </a>

                    <span class="blogicons">
                      <a title="Click to view Full Image" href="{$link->getMediaLink($smart_module_dir)}/smartblog/views/img/{$post.post_img}-single-default.jpg" data-lightbox="example-set" class="icon zoom"></a> 
                    </span>
                  </div>
                  <div class="blog_content">
                    <div class="blog_inner">
                      <h4 class="sds_post_title"><a href="{smartblog::GetSmartBlogLink('smartblog_post',$options)}">{$post.title|escape:'htmlall':'UTF-8'|truncate:23:'...'}</a></h4>
                      <p class="desc">
                        {$post.short_description|escape:'htmlall':'UTF-8'|truncate:60:'...'}
                      </p>
                      <div class="read_more">
                        <a title="Click to view Read More" href="{smartblog::GetSmartBlogLink('smartblog_post',$options)}" class="icon readmore">{l s='read more' d='Shop.Theme.Global'}</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            {$i=$i+1}
          {/foreach}
        </div>
      {/if}
      </div>
    </div>
  </div>
</div>