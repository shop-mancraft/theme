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

<div class="block-contact contact-rich col-md-2 links">
	<h4 class="hidden-sm-down">{l s='Store information' d='Shop.Theme.Global'}</h4>
	<div class="title clearfix hidden-md-up" data-toggle="collapse" data-target="#contact-footer">
  	<span class="h3 block-contact-title">{l s='Store information' d='Shop.Theme.Global'}</span>
    <span class="float-xs-right">
      <span class="navbar-toggler collapse-icons">
        <i class="material-icons add">add</i>
        <i class="material-icons remove">remove</i>
      </span>
    </span>
  </div>
 
  <ul id="contact-footer" class="collapse"> 
	  <li class="block">
	  	<div class="icon"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5a2.5 2.5 0 0 1 0-5 2.5 2.5 0 0 1 0 5z" fill="#666"/></svg></div>
      <div class="data">{$contact_infos.address.formatted nofilter}</div>
	  </li>
	  
    {if $contact_infos.phone}
    <li class="block">
		  <div class="data">
        <div class="icon"><i class="material-icons">phone</i></div>
        {* [1][/1] is for a HTML tag. *}
        <span class="title">{l s='Call us:</span> [1]%phone%[/1]'
          sprintf=[
          '[1]' => '<span>',
          '[/1]' => '</span>',
          '%phone%' => $contact_infos.phone
          ]
          d='Shop.Theme.Global'
        }
      </div>
	  </li>
    {/if}
		
    {if $contact_infos.email}
    <li class="block">
		  <div class="data">
	  	  <div class="icon">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <path d="M20 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4-8 5-8-5V6l8 5 8-5v2z" fill="#666" />
          </svg>
        </div>
        {* [1][/1] is for a HTML tag. *}
       <span class="title">{l
          s='Email us:</span> [1]%email%[/1]'
          sprintf=[
            '[1]' => '<a href="mailto:'|cat:$contact_infos.email|cat:'" class="dropdown">',
            '[/1]' => '</a>',
            '%email%' => $contact_infos.email
          ]
          d='Shop.Theme.Global'
        }
		 </div>
    </li>
    {/if}
  
    {if $contact_infos.fax}
    <li class="block">
		  <div class="data">
		  <div class="icon"><i class="material-icons">present_to_all</i></div>
        {* [1][/1] is for a HTML tag. *}
        <span class="title">{l
          s='Fax:</span> [1]%fax%[/1]'
          sprintf=[
            '[1]' => '<span>',
            '[/1]' => '</span>',
            '%fax%' => $contact_infos.fax
          ]
          d='Shop.Theme.Global'
        }
		  </div>
		</li>
    {/if}
	
  </ul>
</div>
