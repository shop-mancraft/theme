{block name='page_title'}
  {l s='Loyalty Program' mod='pshowloyaltyprogram'}
    </h1>
    <p class="leading-0 text-white float-left mt-2 mb-8">
    {if $language.language_code == 'pl-pl'}
        W tym miejscu wymienisz zebrane podczas zakupów punkty na unikalne nagrody dostępne tylko w naszym sklepie online. Każde wydane podczas zakupów xx złotych to jeden punkt w programie lojalnościowym. Punkty te możesz wymienić na dowolną z dostępnych nagród. Warto zaglądać tutaj częściej ponieważ sukcesywnie będą się tutaj pojawiać nowe, unikalne nagrody. Dziękujemy że jesteście z nami, pozdrawiamy Team Mancraft!
    {/if}
    {if $language.language_code == 'en-US'}
        Here you can exchange the points collected during your purchases for unique rewards available only in our online store. Each euro spent during the purchase is one point in the loyalty program. You can exchange these points for any of the available rewards. It is worth checking some parts here because new, unique rewards will be gradually appearing here. Thank you for being with us, best regards Team Mancraft!
    {/if}
  </p><h1>
{/block}

{extends file='page.tpl'}
{block name='page_content'}
  <div class="block-center" id="block-points">
    {assign var="context" value=Context::getContext()}
    {if !Prestashow\PShowLoyaltyProgram\Repository\TermsAcceptRepository::check($context->customer->id)}
      {if empty($terms) && $context->language->iso_code == 'pl'}
        Zapoznaj się z zasadami korzystania z naszego programu lojalnościowego. Szczegóły znajdziesz w <a class="text-primary hover:text-white" href="/pl/content/41-regulamin-programu-lojalnosciowego">regulaminie sklepu</a>.
      {elseif empty($terms) && $context->language->iso_code == 'en'}
        Read the rules for using our loyalty program. You can find them in the store <a class="text-primary hover:text-white" href="/en/content/41-rules-and-regulations-of-loyalty-program">regulations</a>.
      {else}
        {(Tools::htmlentitiesDecodeUTF8($terms)) nofilter}
      {/if}
      <hr/>
      <a href="{$link->getModuleLink('pshowloyaltyprogram', 'account', ['accept_terms' => 1], true)|escape:'html'}" class="btn btn-primary" type="button">{l s='Accept and join' mod='pshowloyaltyprogram'}</a>
    {else}
      <h1 class="page-subheading">
        {l s='Your account' mod='pshowloyaltyprogram'}
      </h1>

      {(Tools::htmlentitiesDecodeUTF8($description)) nofilter}
      <span class="pshow-account-balance">{l s='Account balance' mod='pshowloyaltyprogram'}:
        <strong>{(isset($data.bank) and $data.bank) ? $data.bank->getPoints() : 0} {l s='Points' mod='pshowloyaltyprogram'}</strong>
      </span>
      <span class="pshow-waiting">{l s='Waiting for confirmation' mod='pshowloyaltyprogram'}:
        {if isset($data.sum.unconfirmed)}<strong>{$data.sum.unconfirmed}
          {l s='Points' mod='pshowloyaltyprogram'}
          </strong>{else}
          <strong>0 {l s='Points' mod='pshowloyaltyprogram'}</strong>
        {/if}
      </span>
        
      <form id="exchange" method="post">
        <input type="hidden" name="action" value="getExchange"/>

        <div class="hidden-md-up">
          <div class="flex flex-col border-t-2 mt-4 pt-2">
            {foreach from=$data.points item=point}
              {if $point->getType() == 1}
                <div class="flex flex-col items-start mb-4 border-b-2 pb-2 {if $point->getConfirmed() == 0}pshow-tr-waiting{else}pshow-tr-confirmed{/if} {if $point->getStatus() == 1}pshow-tr-settled{/if}">
                  <div>
                    {if $point->getConfirmed() == 0}
                      <i title="{l s='Waiting for confirmation' mod='pshowloyaltyprogram'}" class="material-icons material-icons-outlined">timer</i>
                    {/if}
                    {if $point->getStatus() == 1}<i
                      title="{l s='Settled points' mod='pshowloyaltyprogram'}"
                      class="fas fa-dollar-sign"></i>{/if}
                  </div>
                  <div>{l s='Order' mod='pshowloyaltyprogram'}: {$point->getOrder()->reference}</div>
                  <div class="text-right">{l s='Order value (Tax excl.)' mod='pshowloyaltyprogram'}: {Tools::displayPrice($point->getOrderValue(), $point->getCurrency())}</div>
                  <div class="text-right">{l s='Order value (Tax incl.)' mod='pshowloyaltyprogram'}: {Tools::displayPrice($point->getOrderTaxValue(), $point->getCurrency())}</div>
                  <div class="text-right">{l s='Points' mod='pshowloyaltyprogram'}: {$point->getPointsValue()}</div>
                  <div class="text-right">{l s='Order date' mod='pshowloyaltyprogram'}: {$point->getDateAdd()}</div>
                </div>
              {elseif $point->getType() == 2}
                <div class="flex flex-col items-start mb-4 border-b-2 pb-2 {if $point->getConfirmed() == 0}pshow-tr-waiting{else}pshow-tr-confirmed{/if} {if $point->getStatus() == 1}pshow-tr-settled{/if}">
                  <div>
                    {if $point->getConfirmed() == 0}
                      <i title="{l s='Waiting for confirmation' mod='pshowloyaltyprogram'}" class="material-icons material-icons-outlined">timer</i>
                    {/if}
                    {if $point->getStatus() == 1}<i
                      title="{l s='Settled points' mod='pshowloyaltyprogram'}"
                      class="fas fa-dollar-sign"></i>{/if}
                  </div>
                  <div>Newsletter</div>
                  <div class="text-right">-</div>
                  <div class="text-right">-</div>
                  <div class="text-right">{l s='Points' mod='pshowloyaltyprogram'}: {$point->getPointsValue()}</div>
                  <div class="text-right">{l s='Date' mod='pshowloyaltyprogram'}: {$point->getDateAdd()}</div>
                </div>
              {elseif $point->getType() == 3}
                <div class="flex flex-col items-start mb-4 border-b-2 pb-2 {if $point->getConfirmed() == 0}pshow-tr-waiting{else}pshow-tr-confirmed{/if} {if $point->getStatus() == 1}pshow-tr-settled{/if}">
                  <div>{if $point->getConfirmed() == 0}
                      <i title="{l s='Waiting for confirmation' mod='pshowloyaltyprogram'}" class="material-icons material-icons-outlined">timer</i>
                    {/if}{if $point->getStatus() == 1}<i
                      title="{l s='Settled points' mod='pshowloyaltyprogram'}"
                      class="fas fa-dollar-sign"></i>{/if}
                  </div>
                  <div>{$point->getReason()}</div>
                  <div class="text-right">-</div>
                  <div class="text-right">-</div>
                  <div class="text-right">{l s='Points' mod='pshowloyaltyprogram'}: {$point->getPointsValue()}</div>
                  <div class="text-right">{l s='Date' mod='pshowloyaltyprogram'}: {$point->getDateAdd()}</div>
                </div>
              {elseif $point->getType() == 4}
                <div class="flex flex-col items-start mb-4 border-b-2 pb-2 {if $point->getConfirmed() == 0}pshow-tr-waiting{else}pshow-tr-confirmed{/if} {if $point->getStatus() == 1}pshow-tr-settled{/if}">
                  <div>{if $point->getConfirmed() == 0}
                      <i title="{l s='Waiting for confirmation' mod='pshowloyaltyprogram'}" class="material-icons material-icons-outlined">timer</i>
                    {/if}{if $point->getStatus() == 1}<i
                      title="{l s='Settled points' mod='pshowloyaltyprogram'}"
                      class="fas fa-dollar-sign"></i>{/if}
                  </div>
                  <div>{l s='New account' mod='pshowloyaltyprogram'}</div>
                  <div class="text-right">-</div>
                  <div class="text-right">-</div>
                  <div class="text-right">{l s='Points' mod='pshowloyaltyprogram'}: {$point->getPointsValue()}</div>
                  <div class="text-right">{l s='Date' mod='pshowloyaltyprogram'}: {$point->getDateAdd()}</div>
                </div>
              {else}
              {/if}
            {/foreach}
          </div>
        </div>


        <table id="points" class="table hidden-sm-down">
          <thead>
          <tr>
            <th></th>
            <th class="text-right">{l s='Order' mod='pshowloyaltyprogram'}</th>
            <th class="text-right">{l s='Order value (Tax excl.)' mod='pshowloyaltyprogram'}</th>
            <th class="text-right">{l s='Order value (Tax incl.)' mod='pshowloyaltyprogram'}</th>
            <th class="text-right">{l s='Points' mod='pshowloyaltyprogram'}</th>
            <th class="text-right">{l s='Order date' mod='pshowloyaltyprogram'}</th>
          </tr>
          </thead>
          <tbody>
          {foreach from=$data.points item=point}
            {if $point->getType() == 1}
              <tr class="{if $point->getConfirmed() == 0}pshow-tr-waiting{else}pshow-tr-confirmed{/if} {if $point->getStatus() == 1}pshow-tr-settled{/if}">
                <td>{if $point->getConfirmed() == 0}
                      <i title="{l s='Waiting for confirmation' mod='pshowloyaltyprogram'}" class="material-icons material-icons-outlined">timer</i>
                    {/if}{if $point->getStatus() == 1}<i
                    title="{l s='Settled points' mod='pshowloyaltyprogram'}"
                    class="fas fa-dollar-sign"></i>{/if}
                </td>
                <td>{$point->getOrder()->reference}</td>
                <td class="text-right">{Tools::displayPrice($point->getOrderValue(), $point->getCurrency())}</td>
                <td class="text-right">{Tools::displayPrice($point->getOrderTaxValue(), $point->getCurrency())}</td>
                <td class="text-right">{$point->getPointsValue()}</td>
                <td class="text-right">{$point->getDateAdd()}</td>
              </tr>
            {elseif $point->getType() == 2}
              <tr class="{if $point->getConfirmed() == 0}pshow-tr-waiting{else}pshow-tr-confirmed{/if} {if $point->getStatus() == 1}pshow-tr-settled{/if}">
                <td>{if $point->getConfirmed() == 0}
                      <i title="{l s='Waiting for confirmation' mod='pshowloyaltyprogram'}" class="material-icons material-icons-outlined">timer</i>
                    {/if}{if $point->getStatus() == 1}<i
                    title="{l s='Settled points' mod='pshowloyaltyprogram'}"
                    class="fas fa-dollar-sign"></i>{/if}
                </td>
                <td>Newsletter</td>
                <td class="text-right">-</td>
                <td class="text-right">-</td>
                <td class="text-right">{$point->getPointsValue()}</td>
                <td class="text-right">{$point->getDateAdd()}</td>
              </tr>
            {elseif $point->getType() == 3}
              <tr class="{if $point->getConfirmed() == 0}pshow-tr-waiting{else}pshow-tr-confirmed{/if} {if $point->getStatus() == 1}pshow-tr-settled{/if}">
                <td>{if $point->getConfirmed() == 0}
                      <i title="{l s='Waiting for confirmation' mod='pshowloyaltyprogram'}" class="material-icons material-icons-outlined">timer</i>
                    {/if}{if $point->getStatus() == 1}<i
                    title="{l s='Settled points' mod='pshowloyaltyprogram'}"
                    class="fas fa-dollar-sign"></i>{/if}
                </td>
                <td>{$point->getReason()}</td>
                <td class="text-right">-</td>
                <td class="text-right">-</td>
                <td class="text-right">{$point->getPointsValue()}</td>
                <td class="text-right">{$point->getDateAdd()}</td>
              </tr>
            {elseif $point->getType() == 4}
              <tr class="{if $point->getConfirmed() == 0}pshow-tr-waiting{else}pshow-tr-confirmed{/if} {if $point->getStatus() == 1}pshow-tr-settled{/if}">
                <td>{if $point->getConfirmed() == 0}
                      <i title="{l s='Waiting for confirmation' mod='pshowloyaltyprogram'}" class="material-icons material-icons-outlined">timer</i>
                    {/if}{if $point->getStatus() == 1}<i
                    title="{l s='Settled points' mod='pshowloyaltyprogram'}"
                    class="fas fa-dollar-sign"></i>{/if}
                </td>
                <td>{l s='New account' mod='pshowloyaltyprogram'}</td>
                <td class="text-right">-</td>
                <td class="text-right">-</td>
                <td class="text-right">{$point->getPointsValue()}</td>
                <td class="text-right">{$point->getDateAdd()}</td>
              </tr>
            {else}
            {/if}
          {/foreach}
          </tbody>
        </table>
      </form>
      <hr/>
      <div class="row">
        <div class="col-md-4 text-center md:text-left mb-8" id="exchangePanel">
          {if Configuration::get('PSHOW_LP_VOUCHER_EXCHANGE')}
            <button class="btn btn-primary" data-toggle="modal" data-target="#newVoucher"
                    id="historyExchange" type="button">{l s='Generate Voucher' mod='pshowloyaltyprogram'}</button>
          {/if}
        </div>
        <div class="col-xs-12 col-sm-6 col-md-4 text-center mb-8">
          {if Configuration::get('PSHOW_LP_PRODUCT_EXCHANGE')}
            <a href="{$link->getModuleLink('pshowloyaltyprogram', 'exchange', [], true)|escape:'html'}"
               class="btn rounded-full" style="background: #a8d727;">{l s='Products Exchange' mod='pshowloyaltyprogram'}</a>
          {/if}
        </div>
        <div class="col-xs-12 col-sm-6 col-md-4 mb-8" id="historyPanel">
          <button class="btn rounded-full" data-toggle="modal" data-target="#modalHistoryExchange" style="background: #151515;"
                  id="historyExchange" type="button">{l s='Exchange History' mod='pshowloyaltyprogram'}</button>
        </div>
      </div>
      <hr/>
      <p>
        {if $language.language_code == 'pl-pl'}
            Jeśli chcesz sie dowiedzieć jak poruszac sie po naszym programie lojalnościowym, ten prosty tutorial ci w tym pomoże <a class="text-primary hover:text-white" href="/pl/content/43-instrukcja-obslugi-programu-lojalnosciowego">Instrukcja obsługi programu lojalnościowego (shop-mancraft.com)</a><br/><br/>
            Przed przystąpieniem do wyboru nagrody, koniecznie zapoznaj się z regulaminem naszego programu loajalnościowego - <a class="text-primary hover:text-white" href="/pl/content/41-regulamin-programu-lojalnosciowego">regulamin</a>
        {/if}
        {if $language.language_code == 'en-US'}
            If you want to learn how to navigate our loyalty program, this simple tutorial will help you with that <a class="text-primary hover:text-white" href="/en/content/43-loyalty-program-tutorial">Loyalty program tutorial (shop-mancraft.com)</a><br/><br/>
            Before choosing a prize, be sure to read the terms and conditions of our loyalty program - <a class="text-primary hover:text-white" href="/en/content/41-rules-and-regulations-of-loyalty-program">terms and conditions</a>
        {/if}
      </p>
      <div id="newVoucher" class="modal fade" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-body">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h3 class="modal-title">{l s='Get new voucher' mod='pshowloyaltyprogram'}!</h3>
              <div style="display: none" id="voucherError" class="alert alert-danger"></div>
              <form id="exForm" method="post">
                <div class="form-group">
                  <label for="price">{l s='How many points do you want exchange?' mod='pshowloyaltyprogram'}</label>
                  <div class="input-group">
                    <div class="input-group-addon">{l s='Points' mod='pshowloyaltyprogram'}</div>
                    <input step="0.01" type="number" name="points" class="form-control" id="pointsToEx"
                           placeholder="{l s='Type points value' mod='pshowloyaltyprogram'}">
                  </div>
                </div>
                <div class="form-group text-right">
                  <button type="button"
                          class="btn btn-primary generateVoucher">{l s='Do exchange' mod='pshowloyaltyprogram'}</button>
                </div>
              </form>
              <div id="exResult" style="display: none">
                <div class="alert alert-success">{l s='The coupon has been successfully generated!' mod='pshowloyaltyprogram'}</div>
                <p>{l s='Code' mod='pshowloyaltyprogram'} <span id="voucherCode"></span></p>
                <p>{l s='Amount' mod='pshowloyaltyprogram'} <span id="voucherAmount"></span></p>
                <p>{l s='Date expiration' mod='pshowloyaltyprogram'} <span id="voucherExpire"></span></p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div id="modalHistoryExchange" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-body">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h3 class="modal-title">{l s='Exchange History' mod='pshowloyaltyprogram'}</h3>
              <div class="modal-body">

                <div class="hidden-md-up">
                  <div class="flex flex-col border-t-2 mt-4 pt-2">
                    {foreach from=$exchanges item=exchange}
                      <div class="flex flex-col items-start mb-4 border-b-2 pb-2 ">
                        <div>{l s='Voucher' mod='pshowloyaltyprogram'}: {$exchange->getVoucher()->code}</div>
                        <div class="text-right">
                          {l s='Amount' mod='pshowloyaltyprogram'}: 
                          {if $exchange->getValue() > 0}
                            {Tools::displayPrice($exchange->getValue(), $exchange->getVoucherCurrency())}
                          {else}
                            {l s='product' mod='pshowloyaltyprogram'}
                          {/if}
                        </div>
                        <div class="text-right text-red">{l s='Points' mod='pshowloyaltyprogram'}: -{$exchange->getSumPoints()}</div>
                        <div class="text-right">{l s='Date' mod='pshowloyaltyprogram'}: {$exchange->getDateAdd()->format('Y-m-d')}</div>
                        <div class="text-right"><button {if !$exchange->getVoucher()->quantity}disabled{/if} data-id_exchange="{$exchange->getIdExchange()}" class="btn btn-primary returnExchange">{l s='Return' mod='pshowloyaltyprogram'}</button></div>
                      </div>
                    {/foreach}
                  </div>
                </div>

                <table id="tableHistory" class="table table-striped hidden-sm-down">
                  <thead>
                  <tr>
                    <th>{l s='Voucher' mod='pshowloyaltyprogram'}</th>
                    <th class="text-right">{l s='Amount' mod='pshowloyaltyprogram'}</th>
                    <th class="text-right">{l s='Points' mod='pshowloyaltyprogram'}</th>
                    <th class="text-right">{l s='Date' mod='pshowloyaltyprogram'}</th>
                    <th class="text-right"></th>
                  </tr>
                  </thead>
                  <tbody>
                  {foreach from=$exchanges item=exchange}
                    <tr>
                      <td>{$exchange->getVoucher()->code}</td>
                      <td class="text-right">
                        {if $exchange->getValue() > 0}
                          {Tools::displayPrice($exchange->getValue(), $exchange->getVoucherCurrency())}
                        {else}
                          {l s='product' mod='pshowloyaltyprogram'}
                        {/if}
                      </td>
                      <td class="text-right text-red">-{$exchange->getSumPoints()}</td>
                      <td class="text-right">{$exchange->getDateAdd()->format('Y-m-d')}</td>
                      <td class="text-right"><button {if !$exchange->getVoucher()->quantity}disabled{/if} data-id_exchange="{$exchange->getIdExchange()}" class="btn btn-primary returnExchange">{l s='Return' mod='pshowloyaltyprogram'}</button></td>
                    </tr>
                  {/foreach}
                  </tbody>
                </table>
              </div>
              <button type="button" class="btn btn-default"
                      data-dismiss="modal">{l s='Close' mod='pshowloyaltyprogram'}</button>
            </div>
          </div>
        </div>
      </div>
      <div id="returnExchange" class="modal fade" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-body">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h3 class="modal-title">{l s='Return voucher' mod='pshowloyaltyprogram'}</h3>
              <div style="display: none" id="voucherError" class="alert alert-danger"></div>
              <form id="exForm" method="post">
                <div class="form-group">
                  <p>{l s='Are you sure you want return this voucher?' mod='pshowloyaltyprogram'}</p>
                </div>
                <div style="display: none" id="returnExchange-success" class="alert alert-success">{l s='The prize has been returned and the points have been returned to your account.' mod='pshowloyaltyprogram'}</div>
                <div style="display: none" id="returnExchange-error" class="alert alert-danger">{l s='The operation could not be performed. Contact our store\'s staff.' mod='pshowloyaltyprogram'}</div>
                  <button type="button"
                          id="confirmReturnExchange"
                          class="btn btn-primary">{l s='Return' mod='pshowloyaltyprogram'}</button>
              </form>
          </div>
        </div>
      </div>
    {/if}
  </div>
  <script>
    var ajaxUrl = decodeURIComponent('{$ajaxUrl}');
  </script>
{/block}
