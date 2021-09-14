// import Vue from 'vue';
// import BanerSlider from '../vue/baner-slider.vue';
// import Vuex from "vuex";

// Vue.use(Vuex);
// Vue.use(VueAwesomeSwiper);

// const store = new Vuex.Store({
//     state: {
//         // slide: 0
//     },
//     mutations: {
//         // slidePrev (state) {
//         //  state.slide--;
//         // },
//         // slideNext (state) {
//         //  state.slide++;
//         // },
//         // slideReset (state) {
//         //  state.slide = 0;
//         // }  
//     }
// })

// Vue.component('baner-slider', BanerSlider);

// document.addEventListener('DOMContentLoaded', function() {
//     new Vue({ 
//         el: '#page',
//         // store: store,
//         components: {
//             // BanerSlider,
//         },
//     });
// });

jQuery.extend( jQuery.fn.dataTable.defaults, {
  responsive: true,
  paging: false,
  searching: false,
  ordering: false,
  info: false,
  autoWidth : false
});

jQuery(document).ready(function() {
  jQuery('.page-cms #content table').addClass('display').DataTable();

  jQuery('table-responsive').addClass('display').DataTable();
  
  jQuery('#block-history table').addClass('display').DataTable();

  jQuery('#discount table').addClass('display').DataTable();

  jQuery('#tableHistory').addClass('display').DataTable();

  jQuery('#history table').addClass('display').DataTable();

  jQuery('#product-description table').addClass('display').DataTable();
  //discount

});