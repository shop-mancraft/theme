<<<<<<< HEAD
{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}

  {hook h='displayPaymentTop'}

  {* used by javascript to correctly handle cart updates when we are on payment step (eg vouchers added) *}
  <div style="display:none" class="js-cart-payment-step-refresh"></div>

  {if !empty($display_transaction_updated_info)}
  <p class="cart-payment-step-refreshed-info">
    {l s='Transaction amount has been correctly updated' d='Shop.Theme.Checkout'}
  </p>
  {/if}

  {if $is_free}
    <p>{l s='No payment needed for this order' d='Shop.Theme.Checkout'}</p>
  {/if}
  <div class="payment-options {if $is_free}hidden-xs-up{/if}">
    {foreach from=$payment_options item="module_options"}
      {foreach from=$module_options item="option"}
        <div>
          <div id="{$option.id}-container" class="payment-option clearfix">
            {* This is the way an option should be selected when Javascript is enabled *}
            <span class="custom-radio float-xs-left">
              <input
                class="ps-shown-by-js {if $option.binary} binary {/if}"
                id="{$option.id}"
                data-module-name="{$option.module_name}"
                name="payment-option"
                type="radio"
                required
                {if $selected_payment_option == $option.id || $is_free || ($payment_options|@count == 1 && $module_options|@count == 1 )} checked {/if}
              >
              <span></span>
            </span>
            {* This is the way an option should be selected when Javascript is disabled *}
            <form method="GET" class="ps-hidden-by-js">
              {if $option.id === $selected_payment_option}
                {l s='Selected' d='Shop.Theme.Checkout'}
              {else}
                <button class="ps-hidden-by-js" type="submit" name="select_payment_option" value="{$option.id}">
                  {l s='Choose' d='Shop.Theme.Actions'}
                </button>
              {/if}
            </form>

            <label for="{$option.id}">
              <span>{$option.call_to_action_text}</span>
              {if $option.logo}
                <img src="{$option.logo}">
              {/if}
            </label>

          </div>
        </div>

        {if $option.additionalInformation}
          <div
            id="{$option.id}-additional-information"
            class="js-additional-information definition-list additional-information{if $option.id != $selected_payment_option} ps-hidden {/if}"
          >
            {$option.additionalInformation nofilter}
          </div>
        {/if}

        <div
          id="pay-with-{$option.id}-form"
          class="js-payment-option-form {if $option.id != $selected_payment_option} ps-hidden {/if}"
        >
          {if $option.form}
            {$option.form nofilter}
          {else}
            <form id="payment-form" method="POST" action="{$option.action nofilter}">
              {foreach from=$option.inputs item=input}
                <input type="{$input.type}" name="{$input.name}" value="{$input.value}">
              {/foreach}
              <button style="display:none" id="pay-with-{$option.id}" type="submit"></button>
            </form>
          {/if}
        </div>
      {/foreach}
    {foreachelse}
      <p class="alert alert-danger">{l s='Unfortunately, there are no payment method available.' d='Shop.Theme.Checkout'}</p>
    {/foreach}
  </div>

  {if $conditions_to_approve|count}
    <p class="ps-hidden-by-js">
      {* At the moment, we're not showing the checkboxes when JS is disabled
         because it makes ensuring they were checked very tricky and overcomplicates
         the template. Might change later.
      *}
      {l s='By confirming the order, you certify that you have read and agree with all of the conditions below:' d='Shop.Theme.Checkout'}
    </p>

    <form id="conditions-to-approve" method="GET">
      <ul>
        {foreach from=$conditions_to_approve item="condition" key="condition_name"}
          <li>
            <div class="float-xs-left">
              <span class="custom-checkbox">
                <input  id    = "conditions_to_approve[{$condition_name}]"
                        name  = "conditions_to_approve[{$condition_name}]"
                        required
                        type  = "checkbox"
                        value = "1"
                        class = "ps-shown-by-js"
                >
                <span><i class="material-icons rtl-no-flip checkbox-checked">&#xE5CA;</i></span>
              </span>
            </div>
            <div class="condition-label">
              <label class="js-terms" for="conditions_to_approve[{$condition_name}]">
                {$condition nofilter}
              </label>
            </div>
          </li>
        {/foreach}
      </ul>
    </form>
  {/if}

  <div class="mb-4" id="loyalty_program_agreement">
    <ul>
      <li>
       <div class="float-xs-left">
         <span class="custom-checkbox">
           <input id="conditions_to_approve[conditions-loyalty-program]" name="conditions_to_approve[conditions_loyalty_program]" type="checkbox">
           <span>
             <i class="material-icons rtl-no-flip checkbox-checked"></i>
           </span>
         </span>
       </div>
       <div class="condition-label">
         <label class="js-terms" for="conditions_to_approve[conditions-loyalty-program]">
          I agree with the terms of the <a href="{$urls.base_url}content/41-rules-and-regulations-of-loyalty-program" style="color:#A8D727;">Mancraft Loyalty program</a>, I want to collect free points for each product purchased and exchange them for great prizes.
         </label>
       </div>
      </li>
    </ul>
  </div>

  {if $show_final_summary}
    {include file='checkout/_partials/order-final-summary.tpl'}
  {/if}

  <div id="payment-confirmation">
    <div class="ps-shown-by-js">
        <button type="submit" {if !$selected_payment_option} disabled {/if} class="btn btn-primary center-block">
          {l s='Order with an obligation to pay' d='Shop.Theme.Checkout'}
        </button>
      {if $show_final_summary}
        <article class="alert alert-danger mt-2 js-alert-payment-conditions" role="alert" data-alert="danger">
          {l
            s='Please make sure you\'ve chosen a [1]payment method[/1] and accepted the [2]terms and conditions[/2].'
            sprintf=[
              '[1]' => '<a href="#checkout-payment-step">',
              '[/1]' => '</a>',
              '[2]' => '<a href="#conditions-to-approve">',
              '[/2]' => '</a>'
            ]
            d='Shop.Theme.Checkout'
          }
        </article>
      {/if}
    </div>
    <div class="ps-hidden-by-js">
      {if $selected_payment_option and $all_conditions_approved}
        <label for="pay-with-{$selected_payment_option}">{l s='Order with an obligation to pay' d='Shop.Theme.Checkout'}</label>
      {/if}
    </div>
  </div>

  {hook h='displayPaymentByBinaries'}

  <div class="modal fade" id="modal">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}">
          <span aria-hidden="true">&times;</span>
        </button>
        <div class="js-modal-content"></div>
      </div>
    </div>
  </div>
{/block}
=======
{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}

  {hook h='displayPaymentTop'}

  {* used by javascript to correctly handle cart updates when we are on payment step (eg vouchers added) *}
  <div style="display:none" class="js-cart-payment-step-refresh"></div>

  {if !empty($display_transaction_updated_info)}
  <p class="cart-payment-step-refreshed-info">
    {l s='Transaction amount has been correctly updated' d='Shop.Theme.Checkout'}
  </p>
  {/if}

  {if $is_free}
    <p>{l s='No payment needed for this order' d='Shop.Theme.Checkout'}</p>
  {/if}
  <div class="payment-options {if $is_free}hidden-xs-up{/if}">
    {foreach from=$payment_options item="module_options"}
      {foreach from=$module_options item="option"}
        {if !$option.logo|strstr:"/modules/payu/img/logo-payu.svg"}
        <div>
          <div id="{$option.id}-container" class="payment-option clearfix">
            {* This is the way an option should be selected when Javascript is enabled *}
            <span class="custom-radio float-xs-left">
              <input
                class="ps-shown-by-js {if $option.binary} binary {/if}"
                id="{$option.id}"
                data-module-name="{$option.module_name}"
                name="payment-option"
                type="radio"
                required
                {if $selected_payment_option == $option.id || $is_free} checked {/if}
              >
              <span></span>
            </span>
            {* This is the way an option should be selected when Javascript is disabled *}
            <form method="GET" class="ps-hidden-by-js">
              {if $option.id === $selected_payment_option}
                {l s='Selected' d='Shop.Theme.Checkout'}
              {else}
                <button class="ps-hidden-by-js" type="submit" name="select_payment_option" value="{$option.id}">
                  {l s='Choose' d='Shop.Theme.Actions'}
                </button>
              {/if}
            </form>

            <label for="{$option.id}">
              <span>{$option.call_to_action_text|replace:'&amp;':'&'}</span>
              {if $option.logo}
                <img src="{$option.logo}">
              {/if}
              {if $option.module_name == "stripe_official"}
                <img width="30" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABkAAAASwCAIAAAAsYxHAAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAj/ZJREFUeNrs3VmQXedh4Pd7lrt33973FWgQJEEC3AVwAfdF3CVRq7XZ8VgeO1VJxXnKayqpykMqlapUnlJJJg+ZSSoZe+yMZrxItinbkm1JlixRCylRJLGS2IFuAN19t5xL2NRGilh6+br796tLFNAAycZ37z3nO/97znfS3/69wzkAAAAACFVsCAAAAAAImYAFAAAAQNAELAAAAACCJmABAAAAEDQBCwAAAICgCVgAAAAABE3AAgAAACBoAhYAAAAAQROwAAAAAAiagAUAAABA0AQsAAAAAIImYAEAAAAQNAELAAAAgKAJWAAAAAAETcACAAAAIGgCFgAAAABBE7AAAAAACJqABQAAAEDQBCwAAAAAgiZgAQAAABA0AQsAAACAoAlYAAAAAARNwAIAAAAgaAIWAAAAAEETsAAAAAAImoAFAAAAQNAELAAAAACCJmABAAAAEDQBCwAAAICgCVgAAAAABE3AAgAAACBoAhYAAAAAQROwAAAAAAiagAUAAABA0AQsAAAAAIImYAEAAAAQNAELAAAAgKAJWAAAAAAETcACAAAAIGgCFgAAAABBE7AAAAAACJqABQAAAEDQBCwAAAAAgiZgAQAAABA0AQsAAACAoAlYAAAAAARNwAIAAAAgaAIWAAAAAEETsAAAAAAImoAFAAAAQNAELAAAAACCJmABAAAAEDQBCwAAAICgCVgAAAAABE3AAgAAACBoAhYAAAAAQROwAAAAAAiagAUAAABA0AQsAAAAAIImYAEAAAAQNAELAAAAgKAJWAAAAAAETcACAAAAIGgCFgAAAABBE7AAAAAACJqABQAAAEDQBCwAAAAAgiZgAQAAABA0AQsAAACAoAlYAAAAAARNwAIAAAAgaAIWAAAAAEETsAAAAAAImoAFAAAAQNAELAAAAACCJmABAAAAEDQBCwAAAICgCVgAAAAABE3AAgAAACBoAhYAAAAAQROwAAAAAAiagAUAAABA0AQsAAAAAIImYAEAAAAQNAELAAAAgKAJWAAAAAAETcACAAAAIGgCFgAAAABBE7AAAAAACJqABQAAAEDQBCwAAAAAgiZgAQAAABA0AQsAAACAoAlYAAAAAARNwAIAAAAgaAIWAAAAAEETsAAAAAAImoAFAAAAQNAELAAAAACCJmABAAAAEDQBCwAAAICgCVgAAAAABE3AAgAAACBoAhYAAAAAQROwAAAAAAiagAUAAABA0AQsAAAAAIImYAEAAAAQNAELAAAAgKAJWAAAAAAETcACAAAAIGgCFgAAAABBE7AAAAAACJqABQAAAEDQBCwAAAAAgiZgAQAAABA0AQsAAACAoAlYAAAAAARNwAIAAAAgaAIWAAAAAEETsAAAAAAImoAFAAAAQNAELAAAAACCJmABAAAAEDQBCwAAAICgCVgAAAAABE3AAgAAACBoAhYAAAAAQROwAAAAAAiagAUAAABA0AQsAAAAAIImYAEAAAAQNAELAAAAgKAJWAAAAAAETcACAAAAIGgCFgAAAABBE7AAAAAACJqABQAAAEDQBCwAAAAAgiZgAQAAABA0AQsAAACAoAlYAAAAAARNwAIAAAAgaAIWAAAAAEETsAAAAAAImoAFAAAAQNAELAAAAACCJmABAAAAEDQBCwAAAICgCVgAAAAABE3AAgAAACBoAhYAAAAAQROwAAAAAAiagAUAAABA0AQsAAAAAIImYAEAAAAQNAELAAAAgKAJWAAAAAAETcACAAAAIGgCFgAAAABBE7AAAAAACJqABQAAAEDQBCwAAAAAgiZgAQAAABA0AQsAAACAoAlYAAAAAARNwAIAAAAgaAIWAAAAAEETsAAAAAAImoAFAAAAQNAELAAAAACCJmABAAAAEDQBCwAAAICgCVgAAAAABE3AAgAAACBoAhYAAAAAQROwAAAAAAiagAUAAABA0AQsAAAAAIImYAEAAAAQNAELAAAAgKAJWAAAAAAETcACAAAAIGgCFgAAAABBE7AAAAAACJqABQAAAEDQBCwAAAAAgiZgAQAAABA0AQsAAACAoAlYAAAAAARNwAIAAAAgaAIWAAAAAEETsAAAAAAImoAFAAAAQNAELAAAAACCJmABAAAAEDQBCwAAAICgCVgAAAAABE3AAgAAACBoAhYAAAAAQROwAAAAAAiagAUAAABA0AQsAAAAAIImYAEAAAAQNAELAAAAgKAJWAAAAAAETcACAAAAIGgCFgAAAABBE7AAAAAACJqABQAAAEDQBCwAAAAAgiZgAQAAABA0AQsAAACAoAlYAAAAAARNwAIAAAAgaAIWAAAAAEETsAAAAAAImoAFAAAAQNAELAAAAACCJmABAAAAEDQBCwAAAICgCVgAAAAABE3AAgAAACBoAhYAAAAAQROwAAAAAAiagAUAAABA0AQsAAAAAIImYAEAAAAQNAELAAAAgKAJWAAAAAAETcACAAAAIGgCFgAAAABBE7AAAAAACJqABQAAAEDQBCwAAAAAgiZgAQAAABA0AQsAAACAoAlYAAAAAARNwAIAAAAgaAIWAAAAAEETsAAAAAAImoAFAAAAQNAELAAAAACCJmABAAAAEDQBCwAAAICgCVgAAAAABE3AAgAAACBoAhYAAAAAQROwAAAAAAiagAUAAABA0AQsAAAAAIImYAEAAAAQNAELAAAAgKAJWAAAAAAETcACAAAAIGgCFgAAAABBE7AAAAAACJqABQAAAEDQBCwAAAAAgiZgAQAAABA0AQsAAACAoAlYAAAAAARNwAIAAAAgaAIWAAAAAEETsAAAAAAImoAFAAAAQNAELAAAAACCJmABAAAAEDQBCwAAAICgCVgAAAAABE3AAgAAACBoAhYAAAAAQROwAAAAAAiagAUAAABA0AQsAAAAAIImYAEAAAAQNAELAAAAgKAJWAAAAAAETcACAAAAIGgCFgAAAABBE7AAAAAACJqABQAAAEDQBCwAAAAAgiZgAQAAABA0AQsAAACAoAlYAAAAAARNwAIAAAAgaAIWAAAAAEETsAAAAAAImoAFAAAAQNAELAAAAACCJmABAAAAEDQBCwAAAICgCVgAAAAABE3AAgAAACBoAhYAAAAAQROwAAAAAAiagAUAAABA0AQsAAAAAIImYAEAAAAQNAELAAAAgKAJWAAAAAAETcACAAAAIGgCFgAAAABBE7AAAAAACJqABQAAAEDQBCwAAAAAgiZgAQAAABA0AQsAAACAoAlYAAAAAARNwAIAAAAgaAIWAAAAAEETsAAAAAAImoAFAAAAQNAELAAAAACCJmABAAAAEDQBCwAAAICgCVgAAAAABE3AAgAAACBoAhYAAAAAQROwAAAAAAiagAUAAABA0AQsAAAAAIImYAEAAAAQNAELAAAAgKAJWAAAAAAETcACAAAAIGgCFgAAAABBE7AAAAAACJqABQAAAEDQBCwAAAAAgiZgAQAAABA0AQsAAACAoAlYAAAAAARNwAIAAAAgaAIWAAAAAEETsAAAAAAImoAFAAAA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YAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIgmYAEAAAAQTcACAAAAIJqABQAAAEA0AQsAAACAaAIWAAAAANEELAAAAACiCVgAAAAARBOwAAAAAIj2vwIMAGqLiivhFZOVAAAAAElFTkSuQmCC" />
              {/if}
            </label>

          </div>
        </div>
        {/if}

        {if $option.additionalInformation}
          <div
            id="{$option.id}-additional-information"
            class="js-additional-information definition-list additional-information{if $option.id != $selected_payment_option} ps-hidden {/if}"
          >
            {$option.additionalInformation nofilter}
          </div>
        {/if}

        <div
          id="pay-with-{$option.id}-form"
          class="js-payment-option-form {if $option.id != $selected_payment_option} ps-hidden {/if}"
        >
          {if $option.form}
            {$option.form nofilter}
          {else}
            <form id="payment-form" method="POST" action="{$option.action nofilter}">
              {foreach from=$option.inputs item=input}
                <input type="{$input.type}" name="{$input.name}" value="{$input.value}">
              {/foreach}
              <button style="display:none" id="pay-with-{$option.id}" type="submit"></button>
            </form>
          {/if}
        </div>
      {/foreach}
    {foreachelse}
      <p class="alert alert-danger">{l s='Unfortunately, there are no payment method available.' d='Shop.Theme.Checkout'}</p>
    {/foreach}
  </div>

  {if $conditions_to_approve|count}
    <p class="ps-hidden-by-js">
      {* At the moment, we're not showing the checkboxes when JS is disabled
         because it makes ensuring they were checked very tricky and overcomplicates
         the template. Might change later.
      *}
      {l s='By confirming the order, you certify that you have read and agree with all of the conditions below:' d='Shop.Theme.Checkout'}
    </p>

    <form id="conditions-to-approve" method="GET">
      <ul>
        {foreach from=$conditions_to_approve item="condition" key="condition_name"}
          <li>
            <div class="float-xs-left">
              <span class="custom-checkbox">
                <input  id    = "conditions_to_approve[{$condition_name}]"
                        name  = "conditions_to_approve[{$condition_name}]"
                        required
                        type  = "checkbox"
                        value = "1"
                        class = "ps-shown-by-js"
                >
                <span><i class="material-icons rtl-no-flip checkbox-checked">&#xE5CA;</i></span>
              </span>
            </div>
            <div class="condition-label">
              <label class="js-terms" for="conditions_to_approve[{$condition_name}]">
                {$condition nofilter}
              </label>
            </div>
          </li>
        {/foreach}
      </ul>
    </form>
  {/if}

  <div class="mb-4" id="loyalty_program_agreement">
    <ul>
      <li>
       <div class="float-xs-left">
         <span class="custom-checkbox">
           <input id="conditions_to_approve[conditions-loyalty-program]" name="conditions_to_approve[conditions_loyalty_program]" type="checkbox">
           <span>
             <i class="material-icons rtl-no-flip checkbox-checked"></i>
           </span>
         </span>
       </div>
       <div class="condition-label">
         <label class="js-terms" for="conditions_to_approve[conditions-loyalty-program]">
          I agree with the terms of the <a href="{$urls.base_url}content/41-rules-and-regulations-of-loyalty-program" style="color:#A8D727;">Mancraft Loyalty program</a>, I want to collect free points for each product purchased and exchange them for great prizes.
         </label>
       </div>
      </li>
    </ul>
  </div>

  {if $show_final_summary}
    {include file='checkout/_partials/order-final-summary.tpl'}
  {/if}

  <div id="payment-confirmation">
    <div class="ps-shown-by-js">
      <button type="submit" {if !$selected_payment_option} disabled {/if} class="btn btn-primary center-block">
        {l s='Order with an obligation to pay' d='Shop.Theme.Checkout'}
      </button>
      {if $show_final_summary}
        <article class="alert alert-danger mt-2 js-alert-payment-conditions" role="alert" data-alert="danger">
          {l
            s='Please make sure you\'ve chosen a [1]payment method[/1] and accepted the [2]terms and conditions[/2].'
            sprintf=[
              '[1]' => '<a href="#checkout-payment-step">',
              '[/1]' => '</a>',
              '[2]' => '<a href="#conditions-to-approve">',
              '[/2]' => '</a>'
            ]
            d='Shop.Theme.Checkout'
          }
        </article>
      {/if}
    </div>
    <div class="ps-hidden-by-js">
      {if $selected_payment_option and $all_conditions_approved}
        <label for="pay-with-{$selected_payment_option}">{l s='Order with an obligation to pay' d='Shop.Theme.Checkout'}</label>
      {/if}
    </div>
  </div>

  {hook h='displayPaymentByBinaries'}

  <div class="modal fade" id="modal">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}">
          <span aria-hidden="true">&times;</span>
        </button>
        <div class="js-modal-content"></div>
      </div>
    </div>
  </div>
{/block}
>>>>>>> MCHD-17
