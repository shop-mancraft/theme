{*
* 2007-2020 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
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
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2020 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<div id="ttcategorytabs" class="tabs products_block clearfix"> 
<div class="tt-titletab">
	<h1 class="h1 products-section-title text-uppercase tt-title">{l s='Top Categories' mod='ttcategoryslider'}</h1> 
	 <ul id="ttcategory-tabs" class="nav nav-tabs clearfix">
		{$count=0}
		{foreach from=$ttcategorysliderinfos item=ttcategorysliderinfo}
			<li class="nav-item">
				<a href="#tab_{$ttcategorysliderinfo.id}" data-toggle="tab" class="nav-link {if $count == 0}active{/if}"><h3 class="tab-title">{$ttcategorysliderinfo.name}</h3></a>
			</li>
			{$count= $count+1}
		{/foreach}
	</ul>
</div>
	<div class="tab-content">
		{$tabcount=0}
		{$tabcat=0}
		{foreach from=$ttcategorysliderinfos item=ttcategorysliderinfo}
			<div id="tab_{$ttcategorysliderinfo.id}" class="tab-pane {if $tabcount == 0}active{/if} row">
					{assign var="tt_cnt" value="1"}
					{assign var="tt_total" value="0"}
					{foreach from=$ttcategorysliderinfo.product item='product'}
						{$tt_total = $tt_total+1}
					{/foreach}
					{if $tt_total > 6}
						<div class="customNavigation">
							<a class="btn prev ttcategory_prev">{l s='prev' mod='ttcategoryslider'}</a>
							<a class="btn next ttcategory_next">{l s='next' mod='ttcategoryslider'}</a>
						</div>
					{/if} 
				{if isset($ttcategorysliderinfo.product) && $ttcategorysliderinfo.product}
                  <div class="categoryimage col-sm-2">
					{if isset($ttcategorysliderinfo.cate_id) && $ttcategorysliderinfo.cate_id}
	                        {if $ttcategorysliderinfo.id == $ttcategorysliderinfo.cate_id.id_category}
                                <img src="{$image_url}/{$ttcategorysliderinfo.cate_id.image}" alt="" class="category_img"/>
							{else}
								<img src="{$image_url}/{$ttcategorysliderinfo.cate_id.image}" alt="" class="category_img"/>
							{/if}
                    {/if}
                   </div>
						<div class="ttcategory col-sm-10">
						<div class="products owl-carousel row">
							{foreach from=$ttcategorysliderinfo.product item='product'}
								{if $tt_total >= 3}
									<!-- Start TemplateTrip 2 product slide code -->
									{if $tt_cnt % 3 == 1}
									<ul>
										<li class="categoryslider">
											<ul>
											<li>
										{/if}
									{/if}
									<!-- End TemplateTrip 2 product slide code -->
									{include file="modules/ttcategoryslider/views/templates/front/ttcategoryproduct.tpl" product=$product}
									  <!-- Start TemplateTrip 2 product slide code -->
									{if $tt_total >= 3}
										{if $tt_cnt % 3 == 0}
												</li>
												</ul>
											</li>
											</ul>
										{/if}
										{/if}
						
										{$tt_cnt = $tt_cnt+1}
								<!-- End TemplateTrip 2 product slide code -->
							{/foreach}
							{if $tt_total >= 3}
								{if $tt_cnt % 3 == 0}
										</li>
										</ul>
									</li>
									</ul>
								{/if}
							{/if}
						</div>
					</div>
				{else}
					<div class="alert alert-info">{l s='No Products in current tab at this time.' mod='ttcategoryslider'}</div>
				{/if}
			</div> 
		{$tabcount= $tabcount+1}
		{/foreach}
	</div> 
</div>