/*
 * Custom code goes here.
 * A template should always ship with an empty custom.js
 */

/*
 * Custom code goes here.
 * A template should always ship with an empty custom.js
 */
/* --------------------------- TmplateTrip JS ------------------------------ */

/* ----------- Start Page-loader ----------- */
$(window).load(function () {
  $(".ttloading-bg").fadeOut("slow");
});
/* ----------- End Page-loader ----------- */

/* ------------ Start Content-width JS --------------- */
function contentwidth() {
  colsWidth = $("#right-column, #left-column").length;
  if ($(window).width() > 1600) {
    $("#content-wrapper").addClass("Cwidth");
    if (colsWidth == 2) {
      $(".Cwidth").css("width", "60%");
    } else if (colsWidth == 1) {
      $(".Cwidth").css("width", "80%");
    } else {
      $(".Cwidth").css("width", "100%");
    }
  } else {
    $("#content-wrapper").removeClass("Cwidth");
    $("#content-wrapper").removeAttr("style");
  }
}
$(document).ready(function () {
  contentwidth();
});
$(window).resize(function () {
  contentwidth();
});

/* ------------ End Content-width JS --------------- */

$(document).ready(function () {
  /* Go to Top JS START */
  if ($("#goToTop").length) {
    var scrollTrigger = 100, // px
      backToTop = function () {
        var scrollTop = $(window).scrollTop();
        if (scrollTop > scrollTrigger) {
          $("#goToTop").addClass("show");
        } else {
          $("#goToTop").removeClass("show");
        }
      };
    backToTop();
    $(window).on("scroll", function () {
      backToTop();
    });
    $("#goToTop").on("click", function (e) {
      e.preventDefault();
      $("html,body").animate(
        {
          scrollTop: 0,
        },
        700
      );
    });
  }
  /* Go to Top JS END */

  /*-----------start menu toggle ------------*/

  $(".topmenu .title_block").click(function (event) {
    $(this).toggleClass("active");
    event.stopPropagation();
    $(".topmenu .menu.js-top-menu").slideToggle("2000");
  });
  $(".topmenu .menu.js-top-menu").on("click", function (event) {
    event.stopPropagation();
  });

  /*-----------End menu toggle ------------*/

  /* ----------- Start Templatetrip User-info ----------- */

  $(".ttuserheading").click(function (event) {
    $(this).toggleClass("active");
    event.stopPropagation();
    //$(".wdsearchtoggle").css('display', 'none');
    $("#search_widget").removeClass("active");
    $(".user-info").slideToggle("fast");
  });
  $(".user-info").on("click", function (event) {
    event.stopPropagation();
  });

  /* ----------- End Templatetrip User-info ----------- */

  $("#top_column .homeslider ,#ttcmsservices").wrapAll("<div class='slider-services'></div>");

  /* -------------- Start Homepage Tab ------------------- */

  $("#hometab").append("<div class='tabs'><ul class='nav nav-tabs'></ul></div>");
  $("#hometab .ttfeatured-products .tab-title").wrap(
    "<li class='nav-item'><a class='nav-link' data-toggle='tab' href='#ttfeatured-content'></a></li>"
  );
  $("#hometab .ttnew-products .tab-title").wrap("<li class='nav-item'><a class='nav-link' data-toggle='tab' href='#ttnew-content'></a></li>");
  $("#hometab .tabs ul.nav-tabs").append($("#hometab > section li.nav-item"));

  $("#hometab > section.ttfeatured-products").wrap("<div class='tab-pane fade row' id='ttfeatured-content'>");
  $("#hometab > section.ttnew-products").wrap("<div class='tab-pane fade row' id='ttnew-content'>");
  $("#hometab > .tab-pane").wrapAll("<div class='home-tab-content' id='home-tab-content' />");
  $("#hometab").append($("#hometab > .home-tab-content"));

  $("#hometab .tabs ul.nav-tabs > li:first-child a").addClass("active");
  $("#hometab #home-tab-content .tab-pane:first-child").addClass("in active");
  $("#hometab .tthometab-title ,#hometab .tabs").wrapAll("<div class='tt-titletab'></div>");
  $("#ttcmsleftbanner,.ttspecial-products ,#ttcmstopbanner").wrapAll("<div class='tt-bestsellerbanner'><div class='row'></div></div>");
  $("#ttcmstestimonial,#ttcmsbottombanner").wrapAll("<div class='tt-testibanner'><div class='row'></div></div>");

  $("#module-ttproductwishlist-mywishlist,#module-smartblog-details,#module-smartblog-category,#module-ttcompare-compare").removeClass(
    "layout-full-width"
  );

  /* -------------- End Homepage Tab ------------------- */
  $(".blockcart").removeClass("active");
  $(".blockcart").mouseout(function () {
    $(this).removeClass("active");
  });
  $(".blockcart").mouseover(function () {
    $(this).addClass("active");
  });

  /* ------------ Start Add Product Bootsrap class JS --------------- */

  colsCarousel = $("#right-column, #left-column").length;
  if (colsCarousel == 2) {
    ci = 2;
  } else if (colsCarousel == 1) {
    ci = 3;
  } else {
    ci = 3;
  }

  var cols_count = $("#right-column, #left-column").length;
  var prod_miniature = $("#content .products .product-miniature, #content-wrapper .products .product-miniature");
  if (!prod_miniature.hasClass("swiper-slide")) {
    if (cols_count == 2) {
      prod_miniature.attr("class", "product-miniature js-product-miniature product-grid relative px-4 float-left tablet:w-1/2 w-full");
    } else if (cols_count == 1) {
      prod_miniature.attr(
        "class",
        "product-miniature js-product-miniature product-grid relative px-4 float-left tablet:w-3/12 phone-wide:w-1/2 w-full"
      );
    } else {
      prod_miniature.attr(
        "class",
        "product-miniature js-product-miniature product-grid relative px-4 float-left tablet:w-3/12 phone-wide:w-1/2 w-full"
      );
    }
  }

  /* ------------ End Add Product Bootsrap class JS --------------- */

  /* ----------- carousel For FeatureProduct ----------- */

  var ttfeature = $(".ttfeatured-products .products");

  $(ttfeature).find(".owl-wrapper-outer").children().unwrap();
  $(ttfeature).find(".owl-wrapper").children().unwrap();

  ttfeature.owlCarousel({
    items: 5, //10 items above 1000px browser width
    itemsDesktop: [1599, 4],
    itemsDesktopSmall: [1199, 3],
    itemsTablet: [767, 2],
    itemsMobile: [480, 1],
  });

  // Custom Navigation Events
  $(".ttfeature_next").click(function () {
    ttfeature.trigger("owl.next");
  });

  $(".ttfeature_prev").click(function () {
    ttfeature.trigger("owl.prev");
  });

  /* ----------- carousel For ttnew-products ----------- */

  var ttnew = $(".ttnew-products .products");
  ttnew.owlCarousel({
    items: 6, //10 items above 1000px browser width
    itemsDesktop: [1599, 4],
    itemsDesktopSmall: [1199, 3],
    itemsTablet: [767, 2],
    itemsMobile: [480, 1],
  });

  // Custom Navigation Events
  $(".ttnew_next").click(function () {
    ttnew.trigger("owl.next");
  });

  $(".ttnew_prev").click(function () {
    ttnew.trigger("owl.prev");
  });

  /* ------------- carousel For bestseller ------------- */

  const swiperBestseller = new Swiper("[data-bestsellers-swiper]", {
    slidesPerView: 1,
    spaceBetween: 0,
    watchOverflow: true,
    autoplay: {
      delay: 4000,
      disableOnInteraction: false,
    },
    breakpoints: {
      480: {
        slidesPerView: 2,
      },
      768: {
        slidesPerView: 3,
      },
      1200: {
        slidesPerView: 4,
      },
      1600: {
        slidesPerView: 5,
      },
    },
    navigation: {
      nextEl: ".ttbestseller_next",
      prevEl: ".ttbestseller_prev",
    },
  });
  // Custom Navigation Events
  $(".ttbestseller_next").click(function () {
    ttbestseller.trigger("owl.next");
  });

  $(".ttbestseller_prev").click(function () {
    ttbestseller.trigger("owl.prev");
  });

  /* ----------- carousel For ttspecial ----------- */

  var ttspecial = $(".ttspecial-products:not(.ttnewproducts-products) .products");
  ttspecial.owlCarousel({
    items: 1, //10 items above 1000px browser width
    itemsDesktop: [1299, 1],
    itemsDesktopSmall: [1199, 1],
    itemsTablet: [767, 1],
    itemsMobile: [480, 1],
  });

  // Custom Navigation Events
  $(".ttspecial-products:not(.ttnewproducts-products) .ttspecial_next").click(function () {
    ttspecial.trigger("owl.next");
  });

  $(".ttspecial-products:not(.ttnewproducts-products) .ttspecial_prev").click(function () {
    ttspecial.trigger("owl.prev");
  });

  /* ----------- carousel For ttnewproducts ----------- */

  var ttnewproducts = $(".ttnewproducts-products .products");
  ttnewproducts.owlCarousel({
    items: 1, //10 items above 1000px browser width
    itemsDesktop: [1299, 1],
    itemsDesktopSmall: [1199, 1],
    itemsTablet: [767, 1],
    itemsMobile: [480, 1],
  });

  // Custom Navigation Events
  $(".ttnewproducts_next").click(function () {
    ttnewproducts.trigger("owl.next");
  });

  $(".ttnewproducts_prev").click(function () {
    ttnewproducts.trigger("owl.prev");
  });

  /* ----------- carousel For viewproduct ----------- */

  var viewproduct = $(".view-product .products");
  viewproduct.owlCarousel({
    items: 4, //10 items above 1000px browser width
    itemsDesktop: [1599, 3],
    itemsDesktopSmall: [1199, 3],
    itemsTablet: [767, 2],
    itemsMobile: [480, 1],
  });

  // Custom Navigation Events
  $(".viewproduct_next").click(function () {
    viewproduct.trigger("owl.next");
  });

  $(".viewproduct_prev").click(function () {
    viewproduct.trigger("owl.prev");
  });

  /* ----------- carousel For Crossselling ----------- */

  var Crossselling = $(".crossselling-product .products");
  Crossselling.owlCarousel({
    items: 4, //10 items above 1000px browser width
    itemsDesktop: [1599, 3],
    itemsDesktopSmall: [1199, 3],
    itemsTablet: [767, 2],
    itemsMobile: [480, 1],
  });

  // Custom Navigation Events
  $(".Crossselling_next").click(function () {
    Crossselling.trigger("owl.next");
  });

  $(".Crossselling_prev").click(function () {
    Crossselling.trigger("owl.prev");
  });

  /* ----------- carousel For Categoryproducts ----------- */

  var Categoryproducts = $(".category-products .products");
  Categoryproducts.owlCarousel({
    items: 4, //10 items above 1000px browser width
    itemsDesktop: [1599, 3],
    itemsDesktopSmall: [1199, 3],
    itemsTablet: [767, 2],
    itemsMobile: [480, 1],
  });

  // Custom Navigation Events
  $(".Categoryproducts_next").click(function () {
    Categoryproducts.trigger("owl.next");
  });

  $(".Categoryproducts_prev").click(function () {
    Categoryproducts.trigger("owl.prev");
  });

  /* ----------- carousel For accessories ----------- */

  var accessories = $(".product-accessories .products");
  accessories.owlCarousel({
    items: 4, //10 items above 1000px browser width
    itemsDesktop: [1599, 3],
    itemsDesktopSmall: [1199, 3],
    itemsTablet: [767, 2],
    itemsMobile: [480, 1],
  });

  // Custom Navigation Events
  $(".accessories_next").click(function () {
    accessories.trigger("owl.next");
  });

  $(".accessories_prev").click(function () {
    accessories.trigger("owl.prev");
  });

  /* ----------- carousel For Featured products ----------- */

  var Featuredproducts = $(".featured-products .products");
  Featuredproducts.owlCarousel({
    items: 4, //10 items above 1000px browser width
    itemsDesktop: [1599, 3],
    itemsDesktopSmall: [1199, 3],
    itemsTablet: [767, 2],
    itemsMobile: [480, 1],
  });

  // Custom Navigation Events
  $(".featuredproduct_prev").click(function () {
    Featuredproducts.trigger("owl.next");
  });

  $(".featuredproduct_next").click(function () {
    Featuredproducts.trigger("owl.prev");
  });

  /* ----------- Start Carousel For Productpage Thumbs ----------- */

  $("#ttproduct-thumbs").owlCarousel({
    navigation: true,
    navigationText: ["<i class='material-icons'>chevron_left</i>", "<i class='material-icons'>chevron_right</i>"],
    items: 5, //10 items above 1000px browser width
    itemsDesktop: [1599, 4],
    itemsDesktopSmall: [1200, 3],
    itemsTablet: [767, 2],
    itemsMobile: [480, 1],
  });

  /* ----------- End Carousel Productpage Thumbs ----------- */

  /* -----------Start carousel For TT- brand logo ----------- */

  var ttbrandlogo = $("#ttbrandlogo-carousel");
  ttbrandlogo.owlCarousel({
    autoPlay: true,
    stopOnHover: true,
    items: 6, //10 items above 1000px browser width
    itemsDesktop: [1200, 5],
    itemsDesktopSmall: [991, 4],
    itemsTablet: [767, 3],
    itemsMobile: [480, 2],
  });

  // Custom Navigation Events
  $(".ttbrandlogo_next").click(function () {
    ttbrandlogo.trigger("owl.next");
  });

  $(".ttbrandlogo_prev").click(function () {
    ttbrandlogo.trigger("owl.prev");
  });

  /* -----------End carousel For TT brand logo ----------- */

  /* -----------Start carousel For TT- Category Product ----------- */

  var ttcategory = $("#ttcategorytabs .tab-content .tab-pane .ttcategory .products").owlCarousel({
    items: 3, //10 items above 1000px browser width
    itemsDesktop: [1599, 2],
    itemsDesktopSmall: [991, 2],
    itemsTablet: [767, 2],
    itemsMobile: [680, 1],
  });
  // Custom Navigation Events
  $(".ttcategory_next").click(function () {
    ttcategory.trigger("owl.next");
  });

  $(".ttcategory_prev").click(function () {
    ttcategory.trigger("owl.prev");
  });

  /* -----------End carousel For TT- Category Product ----------- */

  /* ----------- Start Carousel For Topcategories  ----------- */

  var ttcategoryfeature = $("#tt_cat_featured").owlCarousel({
    items: 4, //10 items above 1000px browser width
    itemsDesktop: [1299, 3],
    itemsDesktopSmall: [991, 2],
    itemsTablet: [767, 2],
    itemsMobile: [480, 1],
  });
  // Custom Navigation Events
  $(".ttcategoryfeature_next").click(function () {
    ttcategoryfeature.trigger("owl.next");
  });

  $(".ttcategoryfeature_prev").click(function () {
    ttcategoryfeature.trigger("owl.prev");
  });

  /* ----------- End Carousel For Topcategories  ----------- */

  /* -----------Start carousel For Testimonial ----------- */
  var tttestimonial = $("#tttestimonial-carousel");
  tttestimonial.owlCarousel({
    autoPlay: true,
    stopOnHover: true,
    pagination: true,
    paginationNumbers: false,
    items: 1, //10 items above 1000px browser width
    itemsDesktop: [1200, 1],
    itemsDesktopSmall: [991, 1],
    itemsTablet: [767, 1],
    itemsMobile: [480, 1],
  });
  // Custom Navigation Events
  $(".tttestimonial_next").click(function () {
    tttestimonial.trigger("owl.next");
  });

  $(".tttestimonial_prev").click(function () {
    tttestimonial.trigger("owl.prev");
  });

  /* ----------- End carousel For Testimonial ----------- */

  /* -----------Start carousel For TT-Services logo ----------- */
  var ttservices = $("#ttcmsfooterservice .ttcmsservice-content");
  ttservices.owlCarousel({
    autoPlay: 2000,
    stopOnHover: true,
    items: 5, //10 items above 1000px browser width
    itemsDesktop: [1599, 5],
    itemsDesktopSmall: [991, 3],
    itemsTablet: [767, 3],
    itemsMobile: [543, 2],
  });
  /* -----------End carousel For TT-Services logo ----------- */

  /* ----------- Start Smart Blog JS ----------- */

  var smartblog = $("#smartblog-carousel");
  smartblog.owlCarousel({
    autoPlay: true,
    stopOnHover: true,
    items: 4, //10 items above 1000px browser width
    itemsDesktop: [1599, 3],
    itemsDesktopSmall: [991, 2],
    itemsTablet: [767, 2],
    itemsMobile: [480, 1],
  });

  // Custom Navigation Events
  $(".ttblog_next").click(function () {
    smartblog.trigger("owl.next");
  });

  $(".ttblog_prev").click(function () {
    smartblog.trigger("owl.prev");
  });

  /* ----------- Start TT-Special-additional product JS ----------- */

  var ttaddspecial = $(".ttspecial-products .ttspecialadditional");
  ttaddspecial.owlCarousel({
    autoPlay: true,
    navigation: true,
    navigationText: ["<i class='material-icons'>chevron_left</i>", "<i class='material-icons'>chevron_right</i>"],
    items: 2, //10 items above 1000px browser width
    itemsDesktop: [1599, 1],
    itemsDesktopSmall: [1199, 1],
    itemsTablet: [767, 1],
    itemsMobile: [480, 2],
  });

  $(".js-thumb-special").on("click", function (t) {
    t.preventDefault();
    var main_img = $(this).closest(".ttproduct-image").find(".js-qv-product-cover-img");
    $(".js-thumb").hasClass("selected") && $(".js-thumb").removeClass("selected"),
      $(t.currentTarget).addClass("selected"),
      $(main_img).attr("src", $(t.target).data("image-large-src"));
  });

  /* ----------- End TT-Special-additional product JS ----------- */

  /* -----------Start carousel For TT-Megamenu Product 1----------- */

  var ttmegamenuproduct1 = $("#tt-menu-horizontal .product-block .ul-column");
  ttmegamenuproduct1.owlCarousel({
    autoPlay: true,
    stopOnHover: true,
    navigation: true,
    navigationText: ["<i class='material-icons'>chevron_left</i>", "<i class='material-icons'>chevron_right</i>"],
    items: 1, //10 items above 1000px browser width
    itemsDesktop: [1200, 1],
    itemsDesktopSmall: [991, 2],
    itemsTablet: [767, 2],
    itemsMobile: [480, 1],
  });

  /* -----------End carousel For TT-Megamenu Product 1----------- */

  /* -----------Start carousel For TT-Megamenu Product 2----------- */

  var ttmegamenuproduct2 = $("#tt-menu-horizontal .ttproduct-block");
  ttmegamenuproduct2.owlCarousel({
    autoPlay: true,
    stopOnHover: true,
    navigation: true,
    navigationText: ["<i class='material-icons'>chevron_left</i>", "<i class='material-icons'>chevron_right</i>"],
    items: 4, //10 items above 1000px browser width
    itemsDesktop: [1200, 4],
    itemsDesktopSmall: [991, 2],
    itemsTablet: [767, 2],
    itemsMobile: [480, 1],
  });

  /* -----------End carousel For TT-Megamenu Product 2----------- */

  /* ---------------- start Templatetrip link more menu ----------------------*/

  var max_link = 5;
  var items = $("#tttop-link-block ul li");
  var surplus = items.slice(max_link, items.length);
  surplus.wrapAll('<li class="more_menu tttoplink"><ul class="top-link clearfix">');
  $(".more_menu").prepend('<a href="#" class="level-top">More	<i class="material-icons icon">chevron_right</i> </a>');
  $(".more_menu").mouseover(function () {
    $(this).children("ul").addClass("shown-link");
  });
  $(".more_menu").mouseout(function () {
    $(this).children("ul").removeClass("shown-link");
  });

  /* ---------------- End Templatetrip link more menu ----------------------*/
  $(".block-social").insertAfter($("#socials"));

  /* ----------- Start Templatetrip AddToCart Button ----------- */

  $(".tt-button-container .add-to-cart").mousedown(function () {
    var form_className = $(this).parent().attr("class");
    $(this).parent().attr("id", form_className);

    var hidden_page_className = $(this).parent().find(".product-quantity .product_page_product_id").attr("class");
    $(this).parent().find(".product-quantity .product_page_product_id").attr("id", hidden_page_className);

    var customization_className = $(this).parent().find(".product-quantity .product_customization_id").attr("class");
    $(this).parent().find(".product-quantity .product_customization_id").attr("id", customization_className);

    var quantity_className = $(this).parent().find(".product-quantity .quantity_wanted").attr("class");
    $(this).parent().find(".product-quantity .quantity_wanted").attr("id", quantity_className);
  });

  $(".tt-button-container .add-to-cart").mouseup(function () {
    $(this).parent().removeAttr("id");
    $(this).parent().find(".product-quantity > input").removeAttr("id");
  });

  /* ----------- End Templatetrip AddToCart Button ----------- */

  productadditional("#main #tt-jqzoom");
  $("#zoom1").zoom();
});

function productadditional(productId) {
  var ttadditional = $(productId);
  ttadditional.owlCarousel({
    navigation: true,
    navigationText: ["<i class='material-icons'>chevron_left</i>", "<i class='material-icons'>chevron_right</i>"],
    items: 3, //10 items above 1000px browser width
    itemsDesktop: [1200, 2],
    itemsDesktopSmall: [991, 2],
    itemsTablet: [767, 3],
    itemsMobile: [543, 2],
  });
}

/* ---------------- start Templatetrip more menu ----------------------*/
if ($(document).width() <= 1599) {
  var max_elem = 5;
} else if ($(document).width() >= 1599) {
  var max_elem = 10;
}
var menu = $(".tt-menu-horizontal li.level-1");
if (menu.length > max_elem) {
  $(".tt-menu-horizontal .main-menu .menu-content").append(
    '<li class="level-1 more"><div class="more-menu"><span class="categories">More<i class="material-icons">add</i></span></div></li>'
  );
}

$(".tt-menu-horizontal .main-menu .menu-content .more-menu").click(function () {
  if ($(this).hasClass("active")) {
    menu.each(function (j) {
      if (j >= max_elem) {
        $(this).slideUp(200);
      }
    });
    $(this).removeClass("active");
    $(".more-menu").html('<span class="categories">More<i class="material-icons">add</i></span>');
  } else {
    menu.each(function (j) {
      if (j >= max_elem) {
        $(this).slideDown(200);
      }
    });
    $(this).addClass("active");
    $(".more-menu").html('<span class="categories">Less <i class="material-icons">remove</i></span>');
  }
});

menu.each(function (j) {
  if (j >= max_elem) {
    $(this).css("display", "none");
  }
});
/* ---------------- End Templatetrip more menu ----------------------*/

/* ---------------- start Templatetrip sub cat more menu ----------------------*/
if ($(document).width() >= 320) {
  var max_link = 2;
}
$(".tt_category_feature .content .ttcat-content .sub-cat > ul").each(function () {
  var subcat = $(this).find("li");
  var mainul = $(this).parent().closest(".ttcat-content").find(".cat-infor > .title > a");
  var ahref = mainul.attr("href");
  if (subcat.length > max_link) {
    $(this).append('<li class="cat-more"><div class="cat-more-menu"><span class="categories"><a href="' + ahref + '">More</a></span></div></li>');
  }
  subcat.each(function (j) {
    if (j >= max_link) {
      $(this).css("display", "none");
      $(this).addClass("disable");
    }
  });
});
/* ---------------- End Templatetrip sub cat more menu ----------------------*/

/* Start Homepage header JS */

function header() {
  if (jQuery(window).width() > 1199) {
    if (jQuery(this).scrollTop() > 600) {
      jQuery(".full-header").addClass("fixed");
      jQuery("#_desktop_user_info").prependTo(".position-static");
      jQuery("#_desktop_cart").prependTo(".position-static");
    } else {
      jQuery(".full-header").removeClass("fixed");
      jQuery("#_desktop_cart").appendTo("#right-nav-header .container");
      jQuery("#_desktop_user_info").appendTo("#right-nav-header .container");
    }
  } else {
    jQuery(".full-header").removeClass("fixed");
  }
}

$(document).ready(function () {
  header();
});
jQuery(window).resize(function () {
  header();
});
jQuery(window).scroll(function () {
  header();
});

/* End Homepage header JS */

/*--------- Start js for tttop-link-block -------------*/

function accordionMenu(status) {
  if ($(document).width() <= 991) {
    $("#tttop-link-block ul.block_content").appendTo("#tt-menu-horizontal .main-menu .menu-content");
  } else {
    $("#tt-menu-horizontal .main-menu .menu-content .block_content").appendTo("#right-nav-header #tttop-link-block");
  }
}

$(document).ready(function () {
  accordionMenu();
});
$(window).resize(function () {
  accordionMenu();
});

/*--------- End js for tttop-link-block -------------*/

/*--------- Start js for mega-menu -------------*/

function toggleMenu(status) {
  if ($(document).width() <= 991) {
    $(".full-header .position-static .container_tt_megamenu").prependTo(".header-top #mobile_menu");
  } else {
    $(".container_tt_megamenu").appendTo(".full-header .position-static");
  }
}
$(document).ready(function () {
  toggleMenu();
});
$(window).resize(function () {
  toggleMenu();
});

/*--------- End js for mega-menu -------------*/

/*--------- Start js for contact-link-------------*/

function contact(status) {
  if ($(document).width() <= 991) {
    $("#mobile_top_menu_wrapper .js-top-menu-bottom").appendTo(".header-top #mobile_menu .main-menu");
  }
}
$(document).ready(function () {
  contact();
});
$(window).resize(function () {
  contact();
});

/*--------- End js for contact-link -------------*/

/*--------- Start js for left-column -------------*/

function responsivecolumn() {
  if ($(document).width() <= 991) {
    $("body:not(.page-category) .container #left-column").insertAfter("#content-wrapper");
  } else if ($(document).width() >= 992) {
    $("body:not(.page-category) .container #left-column").insertBefore("#content-wrapper");
  }
}
$(document).ready(function () {
  responsivecolumn();
});
$(window).resize(function () {
  responsivecolumn();
});

/*--------- End js for left-column -------------*/
$(".ttbestseller-content .thumbnail-container").each(function () {
  var $desc = jQuery(this).find(".ttproduct-desc .progress");
  var $qty = jQuery(this).find(".quantity");
  var $pbar = jQuery(this).find(".progress-bar");
  var $progress = $desc;
  var $progressBar = $pbar;
  var $quantity = $qty.html();
  var currentWidth = parseInt($progressBar.css("width"));
  var allowedWidth = parseInt($progress.css("width"));
  var addedWidth = currentWidth + parseInt($quantity);
  if (addedWidth > allowedWidth) {
    addedWidth = allowedWidth;
  }
  var progress = (addedWidth / allowedWidth) * 100;
  $progressBar.animate({ width: progress + "%" }, 100);
});

/* ------------ Start Grid List JS --------------*/
function bindGrid() {
  var view = localStorage.getItem("display");
  if (view == "list") display(view);
  else $(".display").find("#ttgrid").addClass("active");
  //Grid
  $(document).on("click", "#ttgrid", function (e) {
    e.preventDefault();
    display("grid");
  });
  //List
  $(document).on("click", "#ttlist", function (e) {
    e.preventDefault();
    display("list");
  });
}
$("#products .product-list .thumbnail-container .ttproduct-image .hook-reviews").each(function () {
  $(this).insertAfter($(this).parent().parent().parent().find(".ttproduct-desc .product-title"));
});
$("#products .product-grid .thumbnail-container .ttproduct-desc .hook-reviews").each(function () {
  $(this).appendTo($(this).parent().parent().parent().find(".ttproduct-image"));
});
$("#products .product-grid .thumbnail-container .ttproduct-desc .ttproducthover").each(function () {
  $(this).insertAfter($(this).parent().parent().parent().find(".product-price-and-shipping"));
});
$("#products .product-list .thumbnail-container .ttproduct-desc .ttproducthover").each(function () {
  $(this).insertAfter($(this).parent().parent().parent().find(".product-description"));
});

function display(view) {
  if (view == "list") {
    $("#ttgrid").removeClass("active");
    $("#ttlist").addClass("active");
    $("#content-wrapper .products.product-thumbs .product-miniature").attr("class", "product-miniature js-product-miniature product-list col-xs-12");
    $("#content-wrapper .products.product-thumbs .product-miniature .ttproduct-image").attr("class", "ttproduct-image col-xs-5 col-sm-5 col-md-3");
    $("#content-wrapper .products.product-thumbs .product-miniature .ttproduct-desc").attr("class", "ttproduct-desc col-xs-7 col-sm-7 col-md-9");
    $("#ttlist").addClass("active");
    $(".grid-list").find("#ttlist").addClass("selected");
    $(".grid-list").find("#ttgrid").removeAttr("class");
    localStorage.setItem("display", "list");
    $("#products .product-list .thumbnail-container .ttproduct-image .hook-reviews").each(function () {
      $(this).insertAfter($(this).parent().parent().parent().find(".ttproduct-desc .product-title"));
    });
    $("#products .product-list .thumbnail-container .ttproduct-desc .ttproducthover").each(function () {
      $(this).insertAfter($(this).parent().parent().parent().find(".product-description"));
    });
  } else {
    $("#ttlist").removeClass("active");
    $("#ttgrid").addClass("active");

    var cols_count = $("#right-column, #left-column").length;
    if (cols_count == 2) {
      $("#js-product-list .products.product-thumbs .product-miniature").attr(
        "class",
        "product-miniature js-product-miniature product-grid relative px-4 float-left tablet:w-1/2 w-full"
      );
    } else if (cols_count == 1) {
      $("#js-product-list .products.product-thumbs .product-miniature").attr(
        "class",
        "product-miniature js-product-miniature product-grid relative px-4 float-left tablet:w-3/12 phone-wide:w-1/2 w-full"
      );
    } else {
      $("#js-product-list .products.product-thumbs .product-miniature").attr(
        "class",
        "product-miniature js-product-miniature product-grid relative px-4 float-left tablet:w-3/12 phone-wide:w-1/2 w-full"
      );
    }

    $("#content-wrapper .products.product-thumbs .product-miniature .ttproduct-image").attr("class", "ttproduct-image");
    $("#content-wrapper .products.product-thumbs .product-miniature .ttproduct-desc").attr("class", "ttproduct-desc");

    $(".grid-list").find("#ttgrid").addClass("selected");
    $(".grid-list").find("#ttlist").removeAttr("class");
    localStorage.setItem("display", "grid");
    $("#products .product-grid .thumbnail-container .ttproduct-desc .hook-reviews").each(function () {
      $(this).appendTo($(this).parent().parent().parent().find(".ttproduct-image"));
    });
    $("#products .product-grid .thumbnail-container .ttproduct-desc .ttproducthover").each(function () {
      $(this).insertAfter($(this).parent().parent().parent().find(".product-price-and-shipping"));
    });
  }
}
$(document).ready(function () {
  bindGrid();
});

/* ------------ End Grid List JS --------------*/

$(document).ready(function () {
  if ($(window).width() > 768 && $("#index").length > 0) {
    $(".title-menu-mobile").click();
  }
});

/* ------------ ICON on some product --------------*/

$(document).ready(function () {
  if ($('#product dt:contains("Lifetime guarantee")').length) {
    $('#product .block-title:contains("Lifetime guarantee")').parent().show();
  } else {
    $('#product .block-title:contains("Lifetime guarantee")').parent().hide();
  }
  if ($('#product dt:contains("Dożywotnia gwarancja")').length) {
    $('#product .block-title:contains("Dożywotnia gwarancja")').parent().show();
  } else {
    $('#product .block-title:contains("Dożywotnia gwarancja")').parent().hide();
  }
});

$(document).ready(function () {
  const swiperIcons = new Swiper("[data-icons-swiper]", {
    slidesPerView: 1,
    spaceBetween: 0,
    autoplay: {
      delay: 4000,
      disableOnInteraction: false,
    },
    breakpoints: {
      480: {
        slidesPerView: 2,
      },
      768: {
        slidesPerView: 3,
      },
      1200: {
        slidesPerView: 4,
        allowTouchMove: false,
      },
    },
    navigation: {
      nextEl: ".swiper-icons-next",
      prevEl: ".swiper-icons-prev",
    },
  });

  const swiperCategories = new Swiper("[data-categories-swiper]", {
    slidesPerView: 1,
    slidesPerGroup: 1,
    slidesPerColumn: 2,
    slidesPerColumnFill: "row",
    watchOverflow: true,
    breakpoints: {
      560: {
        slidesPerView: 2,
        slidesPerGroup: 1,
        slidesPerColumn: 2,
        slidesPerColumnFill: "row",
        allowTouchMove: true,
      },
      992: {
        slidesPerView: 3,
        slidesPerGroup: 1,
        slidesPerColumn: 2,
        slidesPerColumnFill: "row",
        allowTouchMove: false,
      },
    },
    navigation: {
      nextEl: ".categories-swiper-next",
      prevEl: ".categories-swiper-prev",
    },
  });

  const swiperMaintenanceCat = new Swiper("[data-maintenance-swiper]", {
    slidesPerView: 1,
    allowTouchMove: true,
    breakpoints: {
      560: {
        slidesPerView: 2,
        allowTouchMove: true,
      },
      992: {
        slidesPerView: 3,
        allowTouchMove: false,
      },
    },
    navigation: {
      nextEl: ".maintenance-swiper-next",
      prevEl: ".maintenance-swiper-prev",
    },
  });

  const swiperPayments = new Swiper("[data-payments-swiper]", {
    slidesPerView: "auto",
    spaceBetween: 20,
    autoplay: {
      delay: 2000,
      disableOnInteraction: false,
    },
    loop: true,
    loopedSlides: 18,
    watchSlidesVisibility: true,
    centeredSlides: false,
    breakpoints: {
      768: {
        centeredSlides: true,
        watchSlidesVisibility: true,
      },
    },
  });

  const bannerElement = document.querySelector("[data-banner-swiper]");
  if (bannerElement) {
    const swiperBanner = new Swiper(bannerElement, {
      slidesPerView: 1,
      loopedSlides: bannerElement.dataset.slidesLength ? bannerElement.dataset.slidesLength : 1,
      allowTouchMove: true,
      speed: 1000,
      loop: true,
      autoplay: {
        delay: bannerElement.dataset.inderval ? bannerElement.dataset.inderval : 5000,
        disableOnInteraction: false,
      },
      navigation: {
        nextEl: ".banner-swiper-next",
        prevEl: ".banner-swiper-prev",
      },
    });
  }

  initProductSwipers();
  if (prestashop) {
    prestashop.on("updatedProduct", initProductSwipers);
  }

  document.querySelector("body").addEventListener("click", () => $("#variants .collapse").collapse("hide"));
});

$(window).load(function () {
  $("#checkout #checkout-payment-step #payment-option-1").trigger("click");
});

function initProductSwipers() {
  const productImagesElement = document.querySelector("[data-product-img-swiper]");
  if (productImagesElement) {
    new Swiper(productImagesElement, {
      slidesPerView: 1,
      spaceBetween: 0,
      allowTouchMove: true,
      pagination: {
        el: ".swiper-pagination",
        type: "bullets",
        clickable: true,
      },
      navigation: {
        nextEl: "[data-product-img-next]",
        prevEl: "[data-product-img-prev]",
      },
      breakpoints: {
        768: {
          spaceBetween: 20,
        },
      },
    });
  }

  const productThumbnailSliderEl = document.querySelector("[data-modal-thumbnails-swiper]");
  if (productThumbnailSliderEl) {
    const swiperModalThumbnails = new Swiper(productThumbnailSliderEl, {
      slidesPerView: "auto",
      allowTouchMove: true,
    });

    const productModalSliderEl = document.querySelector("[data-product-modal-swiper]");
    const modalCountEl = document.querySelector("[data-slides-count]");
    if (productModalSliderEl) {
      const swiperProductModal = new Swiper(productModalSliderEl, {
        slidesPerView: 1,
        spaceBetween: 50,
        autoplay: {
          delay: 5000,
          disableOnInteraction: false,
          pauseOnMouseEnter: true,
        },
        thumbs: {
          swiper: swiperModalThumbnails,
        },
        navigation: {
          nextEl: "[data-modal-slider-next]",
          prevEl: "[data-modal-slider-prev]",
        },
        keyboard: {
          enabled: true,
          onlyInViewport: true,
        },
        allowTouchMove: true,
        on: {
          slideChange: function () {
            if (modalCountEl) {
              modalCountEl.innerText = this.activeIndex + 1 + "/" + modalCountEl.dataset.slidesCount;
            }
          },
        },
      });

      const productModalEl = document.querySelector("[data-product-modal]");
      if (productModalEl && productImagesElement) {
        productImagesElement.querySelectorAll(".swiper-slide").forEach((image, index) => {
          image.addEventListener("click", () => {
            document.body.classList.add("overflow-hidden");
            productModalEl.classList.add("active");
            swiperProductModal.slideTo(index, 0);
          });
        });
        document.querySelector("[data-modal-close]").addEventListener("click", () => {
          document.body.classList.remove("overflow-hidden");
          productModalEl.classList.remove("active");
        });
      }
    }
  }
}
