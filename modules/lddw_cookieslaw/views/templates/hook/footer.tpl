{**
* 2018 http://www.la-dame-du-web.com
*
* @author Nicolas PETITJEAN <n.petitjean@la-dame-du-web.com>
* @copyright 2018 Nicolas PETITJEAN
* @license MIT License
*}
{if !$cookie_setted}
    <div id="lddw-cookie-modal-box" class="fixed p-3 phone-wide:px-12 text-white text-center z-30 left-0 bottom-0 phone-wide:ml-2 phone-wide:mb-2 bg-black">
        <span class="lddw-cookie-close absolute top-0 right-0 p-2 cursor-pointer right-0"><i class="material-icons text-sm">close</i></span>
        <div class="text-white text-lg font-bold mb-2">{$title|escape:'html':'UTF-8'}</div>
        <p class="mb-3 phone-wide:w-48 mx-auto">{$message}</p>
        <div class="flex flex-row flex-wrap justify-center">
            <button class="btn btn-primary" id="lddw-cookie-agree">{$text_button|escape:'html':'UTF-8'}</button>
            <a class="btn btn-link" id="lddw-cookie-more" href="{$url}">{$text_more|escape:'html':'UTF-8'}</a>
        </div>
    </div>
{/if}
{literal}
    <script>
		window.lddw_cookieslaw = {
			expire: '{/literal}{$expiry}{literal}',
			domain: '{/literal}{$domain}{literal}',
			direction: '{/literal}{$direction}{literal}'
		}
    </script>
{/literal}