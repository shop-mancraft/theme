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
{extends file=$layout}

{block name='content'}

<div class="block-contact">
	<h1 class="text-3xl text-white mb-5">
    {if $language.id == 2}
        Worldwide distributors
    {/if}
    {if $language.id == 1}
       Światowi dystrybutorzy
    {/if}
	</h1>

    {if $language.id == 2}
        <p class="mb-8 text-white">
            In this overview you can see all the distributors that are active worldwide for Mancraft Airsoft. Feel free to contact your local distributors in any case.
        </p>
    {/if}
    {if $language.id == 1}
        <p class="mb-8 text-white">
             W tym przeglądzie możesz zobaczyć wszystkich dystrybutorów Mancraft Airsoft na całym świecie. W każdym przypadku zachęcamy do kontaktu z lokalnymi dystrybutorami.
        </p>
    {/if}

    <div class="flex flex-col-reverse desktop:flex-row flex-wrap min-h-map">
        <ul class="flex flex-col desktop:h-screen overflow-scroll desktop:max-w-md desktop:mr-8">
            {foreach $distributorsArray as $distributor}
                <li class="text-white p-2 border-b border-l border-r {if $distributor@index == 0}border-t{/if}">
                    {$distributor.firstname} {$distributor.lastname}{if $distributor.company != ''}<br/>{/if}
                    {$distributor.company}
                    <br/>
                    {$distributor.address1} {$distributor.address2}<br/>
                    {$distributor.postcode} {$distributor.city} | {$distributor.country_name}
                </li>
            {/foreach}
        </ul>
        <div class="flex-1 min-h-map mb-12" id="map"></div>
    </div>
</div>
{/block}

{block name='javascript_bottom' append}
<script>
    var locations =[
        {foreach $distributorsArray as $distributor}
            {assign var="location" value="[]"}

            {if $distributor.lastname == "Mańkowski"}
                {assign var="location" value="[52.3819409,16.8615313]"}
            {elseif $distributor.lastname == 'Chin'}
                {assign var="location" value="[1.492659, 103.7413591]"}
            {elseif $distributor.lastname == 'Asadi'}
                {assign var="location" value="[33.9412127, -84.2135309]"}
            {elseif $distributor.lastname == 'Melnyk'}
                {assign var="location" value="[51.27029839999999, 22.5693941]"}
            {elseif $distributor.lastname == 'Brühlmann'}
                {assign var="location" value="[47.5660299, 9.1084456]"}
            {elseif $distributor.lastname == 'Pellegrini'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Hamel'}
                {assign var="location" value="[38.888668, -94.66160099999999]"}
            {elseif $distributor.lastname == 'Dąbrowski'}
                {assign var="location" value="[51.68794579999999, 19.4699529]"}
            {elseif $distributor.lastname == 'Sarabia García'}
                {assign var="location" value="[14.5870488, -90.50268349999999]"}
            {elseif $distributor.lastname == 'Shao'}
                {assign var="location" value="[43.4757989, -80.54384499999999]"}
            {elseif $distributor.lastname == 'Górny'}
                {assign var="location" value="[52.3393976, 16.8742367]"}
            {elseif $distributor.lastname == 'Pinilla'}
                {assign var="location" value="[28.4445728, -16.3003479]"}
            {elseif $distributor.lastname == 'Sucharzewski'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Events'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'De Dios bonmati garcía '}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Städler'}
                {assign var="location" value="[47.441523, 9.3934353]"}
            {elseif $distributor.lastname == 'Mamenko'}
                {assign var="location" value="[52.1420421, 19.4827045]"}
            {elseif $distributor.lastname == 'Volianski'}
                {assign var="location" value="[31.804381, 34.655314]"}
            {elseif $distributor.lastname == 'PERCEVAULT'}
                {assign var="location" value="[47.639754, 6.103408]"}
            {elseif $distributor.lastname == 'Ashworth'}
                {assign var="location" value="[53.8299458, -1.6894771]"}
            {elseif $distributor.lastname == 'Schwarz'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'KIM'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'cuyugan'}
                {assign var="location" value="[14.6094248, 121.0326359]"}
            {elseif $distributor.lastname == 'principio'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'koo'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Aubry'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Samuels'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Puto'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Finkilstain'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'alexandre'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Bradbury'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'tactical'}
                {assign var="location" value="[38.994349, -1.8585424]"}
            {elseif $distributor.lastname == 'Arsenal Sports S.A.'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Piatkevich'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'rosenfeld'}
                {assign var="location" value="[]"}                
            {elseif $distributor.lastname == 'Devonish'}
                {assign var="location" value="[]"}  
            {elseif $distributor.lastname == 'Radwański'}
                {assign var="location" value="[]"}  
            {elseif $distributor.lastname == 'NICOLAS ALHAMA'}
                {assign var="location" value="[]"} 
            {elseif $distributor.lastname == 'Grace'}
                {assign var="location" value="[]"}  
            {elseif $distributor.lastname == 'Ifrach'}
                {assign var="location" value="[]"}  
            {elseif $distributor.lastname == 'Ifrach'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Miller'}
                {assign var="location" value="[]"}                
            {elseif $distributor.lastname == 'Johnston'}
                {assign var="location" value="[]"}    
            {elseif $distributor.lastname == 'Poole'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Kozák'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Carabinas e Acessórios EIRELI.'}
                {assign var="location" value="[-22.9189594, -43.3029023]"}
            {elseif $distributor.lastname == 'Groeneveld'}
                {assign var="location" value="[53.40343980000001, 6.612041199999999]"}
            {elseif $distributor.lastname == 'Poteriailo'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Santos'}
                {assign var="location" value="[-23.5456852, -46.7639275]"}
            {elseif $distributor.lastname == 'Hardy'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Solodovnik'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'KLIUIEV'}
                {assign var="location" value="[55.76562, 37.605626]"}
            {elseif $distributor.lastname == 'volianski'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Palumbo'}
                {assign var="location" value="[-8.783195, 34.508523]"}
            {elseif $distributor.lastname == 'García Almeida'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Abt'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Montagna'}
                {assign var="location" value="[48.9937548, 2.3074547]"}
            {elseif $distributor.lastname == 'Ushkalov'}
                {assign var="location" value="[45.12996649999999, 42.0283272]"}
            {elseif $distributor.lastname == 'Samojłowicz'}
                {assign var="location" value="[51.8077189, 19.4391243]"}
            {elseif $distributor.lastname == 'MUÑOZ ALBALADEJO'}
                {assign var="location" value="[37.6281758, -0.9884913999999999]"}
            {elseif $distributor.lastname == 'Berna Espejo'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Giordimaina'}
                {assign var="location" value="[35.8764648, 14.439084]"}
            {elseif $distributor.lastname == 'van hout'}
                {assign var="location" value="[51.34045030000001, 5.451363199999999]"}
            {elseif $distributor.lastname == 'Muller'}
                {assign var="location" value="[52.5229645, 5.4623819]"}
            {elseif $distributor.lastname == 'Jennen'}
                {assign var="location" value="[52.5510892, 13.4089088]"}
            {elseif $distributor.lastname == 'Jakeman'}
                {assign var="location" value="[53.38112899999999, -1.470085]"}
            {elseif $distributor.lastname == 'Lao Lopez'}
                {assign var="location" value="[41.6175899, 0.6200146]"}
            {elseif $distributor.lastname == 'detrez'}
                {assign var="location" value="[50.47318, 5.67584]"}
            {elseif $distributor.lastname == 'CHABORD'}
                {assign var="location" value="[47.5404327, 6.963362399999999]"}
            {elseif $distributor.lastname == 'Mlejnek'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Duistermaat'}
                {assign var="location" value="[52.17236459999999, 5.3928783]"}
            {elseif $distributor.lastname == 'Staaf'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'santamaria'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'ocoro'}
                {assign var="location" value="[36.5404084, -4.621567199999999]"}
            {elseif $distributor.lastname == 'Vlček'}
                {assign var="location" value="[]"}  
            {elseif $distributor.lastname == 'Skorohod'}
                {assign var="location" value="[56.96111630000001, 24.132692]"}  
            {elseif $distributor.lastname == 'Broekhof'}
                {assign var="location" value="[52.7630567, 5.083617200000001]"}  
            {elseif $distributor.lastname == 'Beekvelt'}
                {assign var="location" value="[52.8542113, 5.0384035]"}
            {elseif $distributor.lastname == 'GIMENEZ GORDON'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Žitňan'}
                {assign var="location" value="[52.1420421, 19.4827045]"}
            {elseif $distributor.lastname == 'Kay'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Elfrink'}
                {assign var="location" value="[52.3011506, 6.915570499999999]"}
            {elseif $distributor.lastname == 'Karanko'}
                {assign var="location" value="[60.4516946, 22.2649167]"}
            {elseif $distributor.lastname == 'Wolff'}
                {assign var="location" value="[56.458158, 10.0362685]"}
            {elseif $distributor.lastname == 'Jønsson'}
                {assign var="location" value="[56.2651216, 8.7926989]"}
            {elseif $distributor.lastname == 'Bajic'}
                {assign var="location" value="[46.2060507, 19.5389553]"}
            {elseif $distributor.lastname == 'Nguyen'}
                {assign var="location" value="[56.182643, 10.12224]"}
            {elseif $distributor.lastname == 'Nagy'}
                {assign var="location" value="[52.190675, 21.0965459]"}
            {elseif $distributor.lastname == 'Bielleman'}
                {assign var="location" value="[51.963807, 5.9689837]"}
            {elseif $distributor.lastname == 'Jager'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'marivain'}
                {assign var="location" value="[46.507357, -1.734964]"}
            {elseif $distributor.lastname == 'Lindsen'}
                {assign var="location" value="[51.88745, 5.298880599999999]"}
            {elseif $distributor.lastname == 'Rasina'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Campillo'}
                {assign var="location" value="[-2.1436614, -79.8380988]"}
            {elseif $distributor.lastname == 'Moravek'}
                {assign var="location" value="[50.0735593, 14.4548711]"}
            {elseif $distributor.lastname == 'HIDALGO VALVERDE'}
                {assign var="location" value="[37.3890924, -5.9844589]"}  
            {elseif $distributor.lastname == 'Polenta'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'romijn'}
                {assign var="location" value="[52.0598174, 4.5208713]"}
            {elseif $distributor.lastname == 'Verkammen'}
                {assign var="location" value="[50.8969586, 4.143244699999999]"}
            {elseif $distributor.lastname == 'Vlach'}
                {assign var="location" value="[49.2642901, 16.5571358]"}  
            {elseif $distributor.lastname == 'Noack'}
                {assign var="location" value="[51.75631079999999, 14.3328679]"}
            {elseif $distributor.lastname == 'Engström'}
                {assign var="location" value="[65.80695639999999, 21.7349392]"}
            {elseif $distributor.lastname == 'Salas'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'barbagallo'}
                {assign var="location" value="[44.4926342, 11.8255002]"}  
            {elseif $distributor.lastname == 'Carpeggiani'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Masser'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Dervišić'}
                {assign var="location" value="[46.3900683, 15.571415]"}
            {elseif $distributor.lastname == 'Poisinger'}
                {assign var="location" value="[48.2216205, 16.380956]"}  
            {elseif $distributor.lastname == 'airsoft quimera'}
                {assign var="location" value="[41.3984192, 2.1618671]"}
            {elseif $distributor.lastname == 'giuseppe'}
                {assign var="location" value="[42.4690901, 13.5654488]"}
            {elseif $distributor.lastname == 'Lindh'}
                {assign var="location" value="[63.6744036, 22.6966088]"}
            {elseif $distributor.lastname == 'Reverté'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Stránský'}
                {assign var="location" value="[52.1420421, 19.4827045]"}
            {elseif $distributor.lastname == 'soler valls'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Mendes'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Schou-Lund'}
                {assign var="location" value="[]"}  
            {elseif $distributor.lastname == 'Lengyel'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Schuwer'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Lorente Escolar'}
                {assign var="location" value="[36.7211784, -4.421719899999999]"}
            {elseif $distributor.lastname == 'Andersen'}
                {assign var="location" value="[56.6500324, 9.704985899999999]"}  
            {elseif $distributor.lastname == 'Storm Jessen'}
                {assign var="location" value="[56.26515, 8.78875]"}
            {elseif $distributor.lastname == 'Rocha'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Stankus'}
                {assign var="location" value="[54.7062825, 25.2790509]"}
            {elseif $distributor.lastname == 'OSCAR PEREZ BUENO'}
                {assign var="location" value="[]"}  
            {elseif $distributor.lastname == 'valtellini'}
                {assign var="location" value="[45.5233421, 10.0833398]"}
            {elseif $distributor.lastname == 'Legkostup'}
                {assign var="location" value="[58.36573060000001, 22.4196937]"}
            {elseif $distributor.lastname == 'Forsten'}
                {assign var="location" value="[53.0762119, 6.861691]"}
            {elseif $distributor.lastname == 'Dunnink'}
                {assign var="location" value="[52.6486418, 6.2019286]"}  
            {elseif $distributor.lastname == 'Vestergaard'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Lacko'}
                {assign var="location" value="[49.189519, 18.6714562]"}
            {elseif $distributor.lastname == 'Hennessy'}
                {assign var="location" value="[38.888668, -94.66160099999999]"}
            {elseif $distributor.lastname == 'Gabos'}
                {assign var="location" value="[46.7805455, 23.6266109]"}  
            {elseif $distributor.lastname == 'jonathan'}
                {assign var="location" value="[49.1145818, 7.0836766]"}
            {elseif $distributor.lastname == 'Dahlén'}
                {assign var="location" value="[59.85856380000001, 17.6389267]"}
            {elseif $distributor.lastname == 'Brochado'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Marinov'}
                {assign var="location" value="[43.2140504, 27.9147333]"}  
            {elseif $distributor.lastname == 'Valentijn'}
                {assign var="location" value="[51.5222558, 4.3912397]"}
            {elseif $distributor.lastname == 'Braker'}
                {assign var="location" value="[52.3019016, 6.919336299999999]"}
            {elseif $distributor.lastname == 'visser'}
                {assign var="location" value="[51.8363767, 5.606077099999999]"}
            {elseif $distributor.lastname == 'SARL CHALLENGE AIRSOFT'}
                {assign var="location" value="[]"}  
            {elseif $distributor.lastname == 'Wienken'}
                {assign var="location" value="[52.72922519999999, 8.2838762]"}
            {elseif $distributor.lastname == 'Yannick'}
                {assign var="location" value="[48.5108101, -3.3263676]"}
            {elseif $distributor.lastname == 'Perez Cano'}
                {assign var="location" value="[]"}  
            {elseif $distributor.lastname == 'Nickel'}
                {assign var="location" value="[43.43315200000001, 6.737034]"}
            {elseif $distributor.lastname == ''}
                {assign var="location" value="[42.631111, -2.044722]"}
            {elseif $distributor.lastname == 'AIRSOFT S.L.'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Süvari'}
                {assign var="location" value="[59.4244818, 24.7484576]"}  
            {elseif $distributor.lastname == 'patelas'}
                {assign var="location" value="[48.9392651, 2.6126899]"}
            {elseif $distributor.lastname == 'Hoppe'}
                {assign var="location" value="[53.8696541, 10.6834871]"}
            {elseif $distributor.lastname == 'Vyyryläinen'}
                {assign var="location" value="[61.02809569999999, 24.4488408]"}
            {elseif $distributor.lastname == 'GRANOUILLIT'}
                {assign var="location" value="[]"}  
            {elseif $distributor.lastname == 'Cimadoro'}
                {assign var="location" value="[42.57760710000001, 12.6261735]"}
            {elseif $distributor.lastname == 'Digeser'}
                {assign var="location" value="[48.2437419, 8.6629761]"}
            {elseif $distributor.lastname == 'Journeymission'}
                {assign var="location" value="[41.1887594, -8.498351999999999]"}
            {elseif $distributor.lastname == "Abourig"}
                {assign var="location" value="[51.1794595, 4.3679389]"}  
            {elseif $distributor.lastname == 'Rontschka'}
                {assign var="location" value="[48.1078062, 13.7938255]"}
            {elseif $distributor.lastname == 'Eloy'}
                {assign var="location" value="[]"}  
            {elseif $distributor.lastname == 'Saura Reyes'}
                {assign var="location" value="[41.3396192, 2.0429148]"}
            {elseif $distributor.lastname == 'williams'}
                {assign var="location" value="[48.5527901, -1.7583636]"}
            {elseif $distributor.lastname == 'Andersson'}
                {assign var="location" value="[60.28270300000001, 24.7586843]"}
            {elseif $distributor.lastname == 'Byrom'}
                {assign var="location" value="[]"}  
            {elseif $distributor.lastname == 'Gournianakis'}
                {assign var="location" value="[35.337196, 25.0834615]"}
            {elseif $distributor.lastname == 'Martinez Garrido'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'alvarado'}
                {assign var="location" value="[]"}  
            {elseif $distributor.lastname == 'Corso'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'VILLETTE'}
                {assign var="location" value="[50.638757, 2.396187]"}
            {elseif $distributor.lastname == 'Wicke'}
                {assign var="location" value="[51.0039774, 5.601579399999999]"}  
            {elseif $distributor.lastname == 'Eikenhout'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Vink'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Stary'}
                {assign var="location" value="[50.1321425, 14.4067035]"}  
            {elseif $distributor.lastname == 'Ianculescu'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Brouwer'}
                {assign var="location" value="[52.4291993, 4.7949936]"}
            {elseif $distributor.lastname == 'Tactical'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'van Berkel'}
                {assign var="location" value="[]"}  
            {elseif $distributor.lastname == 'Donald Vankeerberghen'}
                {assign var="location" value="[51.1996486, 3.1514133]"}
            {elseif $distributor.lastname == 'WEBER'}
                {assign var="location" value="[49.258329, 4.031696]"}
            {elseif $distributor.lastname == 'Söderström'}
                {assign var="location" value="[]"}  
            {elseif $distributor.lastname == 'Unipessoal Lda'}
                {assign var="location" value="[38.76867310000001, -9.162221100000002]"}
            {elseif $distributor.lastname == 'van Maaren'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'molina ferriz'}
                {assign var="location" value="[38.609538, -1.1459598]"}
            {elseif $distributor.lastname == 'RIZZO'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Cheung'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'JEROME'}
                {assign var="location" value="[43.7155286, 1.4500043]"}
            {elseif $distributor.lastname == 'Bliss'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Oertig'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Parker'}
                {assign var="location" value="[52.7115579, -2.0003829]"}
            {elseif $distributor.lastname == 'van der Westhuizen'}
                {assign var="location" value="[38.888668, -94.66160099999999]"}
            {elseif $distributor.lastname == 'Allen'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Bowden'}
                {assign var="location" value="[]"}
            {elseif $distributor.lastname == 'Allen'}
                {assign var="location" value="[53.17005, -3.0814879]"}
            {elseif $distributor.lastname == 'Bothamley'}
                {assign var="location" value="[52.5372525, -0.2285405]"}
            {elseif $distributor.lastname == 'Albert'}
                {assign var="location" value="[50.99478, 9.2863071]"}
            {else}
                {assign var="location" value="[]"}
            {/if}


            {ldelim}
                "map": {$location},
                "location" : "{$distributor.address1|escape:'url'}%20{$distributor.address2|escape:'url'}%20{$distributor.city|escape:'url'}%20{$distributor.postcode|escape:'url'}",
                "country" : "{$distributor.country_iso_code}",
                "person": "{$distributor.firstname} {$distributor.lastname}",
                "company": "{$distributor.company}"  
            {rdelim},
        {/foreach}
    ];
    {literal}

    // Initialize and add the map
   window.initMap = function () {
        const store = { lat: 50.3105744, lng: 17.3829746 };
        
        // Search by postcode and city
        var geocoder = new google.maps.Geocoder();

        const map = new google.maps.Map(document.getElementById("map"), {
            zoom: 4,
            center: store,
        });
        
        var storeMarker = new google.maps.Marker({
            title: 'Our Location',
            position: store,
            map: map,
        });

        var infoWindowsStore = new google.maps.InfoWindow({
            content:  'Our Location',
        });

        storeMarker.addListener("click", () => {
            infoWindowsStore.open(map, store);
        });

        var markers = [];
        var infoWindows = [];

        google.maps.event.addListenerOnce(map, 'tilesloaded', function() {
            for (var i = 0; i < locations.length; ++i) {
                if(!jQuery.isEmptyObject(locations[i])){
                    if(locations[i].location !== '' && locations[i].map.length == 0){
                        setTimeout(function(x){
                            geocoder.geocode({
                                address: locations[x].location,
                                region: locations[x].country,
                            }, function(result, status) {
                                if (status == 'OK' && result.length > 0) {
                                    infoWindows[x] = new google.maps.InfoWindow({
                                        content: locations[x].person + '/n <br/>' + (typeof locations[x].company !== 'undefined' || locations[x].company != '' ? locations[x].company : '')
                                    });
                                    
                                    markers[x] = new google.maps.Marker({
                                        title: locations[x].person + (typeof locations[x].company !== 'undefined' || locations[x].company != '' ? ' | Company: ' + locations[x].company : ''),
                                        position: result[0].geometry.location,
                                        map: map
                                    })

                                    locations[x].map = [result[0].geometry.location.lat(),result[0].geometry.location.lng()];

                                    (function(x){markers[x].addListener("click", () => {
                                        infoWindows[x].open(map, markers[x]);
                                    })})(x);
                                }

                            });
                        }, 900 * i, i);
                    } else if(locations[i].map != ''){
                        infoWindows[i] = new google.maps.InfoWindow({
                            content: locations[i].person + (typeof locations[i].company !== 'undefined' || locations[i].company != '' ? ' | Company: ' + locations[i].company : '')
                        });
                        
                        markers[i] = new google.maps.Marker({
                            title: locations[i].person + (typeof locations[i].company !== 'undefined' || locations[i].company != '' ? ' | Company: ' + locations[i].company : ''),
                            position: { lat: locations[i].map[0], lng: locations[i].map[1] },
                            map: map
                        });

                        (function(i){
                            markers[i].addListener("click", () => {
                                infoWindows[i].open(map, markers[i]);
                            })
                        })(i);
                    }
                }
            }
        });
    }

    {/literal}
</script>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCoC80un3xCW_lDNO1_7PEuW2i4bBAPOLk&callback=initMap&libraries=&v=weekly"
></script>
{/block}
