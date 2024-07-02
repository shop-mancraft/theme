{**
* NOTICE OF LICENSE
*
* All rights reserved,
* Please go through LICENSE.txt file inside our module
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade this module to newer
* versions in the future. If you wish to customize this module for your
* needs please refer to CustomizationPolicy.txt file inside our module for more information.
*
*  @author    Webkul IN
*  @copyright since 2010 Webkul
*  @license   LICENSE.txt
*}

{if isset($customer.addresses) && $customer.addresses|count > 0}
    <div class="form-group clearfix wk-align-center">
        <label class="mb-0 h-5">
            <span>
                <input type="radio" name="wk-delivery-address" id="wk-delivery-address-1" value="1" checked="checked" class="relative after:absolute after:left-[2px] after:top-[2.5px] after:content-[''] after:h-[8px]  after:transition after:w-[8px] appearance-none after:rounded-full rounded-full border-2 border-[#64635D] border-solid hover:after:bg-main checked:after:!bg-main checked:bg-white checked:border-main checked:focus:bg-white checked:focus:border-mainchecked:focus:ring-transparent checked:focus:shadow-none checked:hover:bg-white checked:hover:border-main checked:ring-0 checked:ring-transparent cursor-pointer focus:ring-0 focus:ring-offset-0 focus:ring-transparent h-4 outline-none ring-transparent transition transition-all w-4">
                <span></span>
            </span>
        </label>
        <div class="w-full pl-2.5 desktop-presta:pl-[15px]">
            <select class="form-control text-sm !bg-black border border-solid border-[#64635D] focus:border-[#64635D] focus:ring-0 font-body font-medium form-control-select form-select js-country pl-4 rounded-[5px] w-full h-[50px] tablet:h-10" id="wk-existing-delivery-address">
                {foreach $customer.addresses as $addr}
                    <option {if isset($cart.id_address_delivery)} 
                        {if $cart.id_address_delivery == $addr.id}selected="selected"
                            {/if} 
                        {/if} value="{$addr.id}">
                            {$addr.city}, {$addr.address1}
                        </option>
                {/foreach}
            </select>
        </div>
    </div>
{/if}

{if $customer.addresses|count > 0}
    <div class="form-group wk-delivery-address-div clearfix !mb-0">
        <label class="float-left w-5 !mb-0"></label>
        <div class="w-full pl-[26px] desktop-presta:pl-[31px]">
            <address class="wk-diff-address not-italic wk-delivery-address-card text-sm rounded-[5px] !bg-black border border-solid border-[#64635D]">
                {$customer.addresses.{$cart.id_address_delivery}.formatted nofilter}
                <hr class="border-0 mb-5 tablet:mb-10">
                <footer style="text-align: right;margin:0 0.3125rem;">
                    <a class="edit-address font-body font-normal hover:text-main mr-5 tablet:text-sm text-main-dark text-xs transition uppercase" id="wk-delivery-address-edit" href="javascript:void(0);">
                        {l s='Edit' mod='wkonepagecheckout'}
                    </a>
                    <a class="delete-address inline-block border-2 border-main-dark border-solid font-body font-normal hover:bg-main-dark hover:text-white px-6 py-3 rounded-full text-main-dark text-sm transition uppercase whitespace-nowrap" id="wk-delivery-address-delete" href="javascript:void(0);" >
                        {l s='Delete' mod='wkonepagecheckout'}
                    </a>
                </footer>
            </address>
        </div>
    </div>
{/if}

{if $customer.addresses|count > 0}
    <div class="form-group clearfix wk-align-center">
        <label class="mb-0 h-5">
            <span>
                <input type="radio" name="wk-delivery-address" id="wk-delivery-address-2" value="2" data-attr="delivery" class="relative after:absolute after:left-[2px] after:top-[2.5px] after:content-[''] after:h-[8px]  after:transition after:w-[8px] appearance-none after:rounded-full rounded-full border-2 border-[#64635D] border-solid hover:after:bg-main checked:after:!bg-main checked:bg-white checked:border-main checked:focus:bg-white checked:focus:border-mainchecked:focus:ring-transparent checked:focus:shadow-none checked:hover:bg-white checked:hover:border-main checked:ring-0 checked:ring-transparent cursor-pointer focus:ring-0 focus:ring-offset-0 focus:ring-transparent h-4 outline-none ring-transparent transition transition-all w-4">
                <span></span>
            </span>
        </label>
        <div class="col-md-10 col-sm-10 col-xs-10">
            <div class="text-xs">{l s='Add new delivery address' mod='wkonepagecheckout'}
            </div>
        </div>
    </div>
{/if}