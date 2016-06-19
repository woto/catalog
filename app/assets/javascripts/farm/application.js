//= require jquery
//= require jquery_ujs
//= require turbolinks
//
//= require underscore/underscore
//= require URI.js/src/URI.js
//= require holderjs
//= require tether
//
//= require bootstrap/js/dist/util
//= require bootstrap/js/dist/alert
//= require bootstrap/js/dist/button
//= require bootstrap/js/dist/carousel
//= require bootstrap/js/dist/collapse
//= require bootstrap/js/dist/dropdown
//= require bootstrap/js/dist/modal
//= require bootstrap/js/dist/scrollspy
//= require bootstrap/js/dist/tab
//= require bootstrap/js/dist/tooltip
//= require bootstrap/js/dist/popover
//
//= require noUiSlider/distribute/nouislider
//  throught submodule
//  require slick/slick/slick
//  throught gem
//= require jquery.slick
//= require zoom/jquery.zoom
//
//= require farm/products
//= require farm/search
//= require farm/cart

$(document).on('turbolinks:load', function(){
  Holder.addTheme("thumb", { background: "#55595c", foreground: "#eceeef", text: "Thumbnail" });
  Holder.run();
})

var update_navbar_cart_link = function(count){
  var navbar_cart_link = $('.js-navbar__cart-link-count').text(count);
  Turbolinks.clearCache();
}

$(document).on('ajax:success', '.js-add-to-cart-button', function(event, data, status, xhr){
  var add_to_cart_button = $('.js-add-to-cart-button[data-id="'+$(this).data('id')+'"]');
  add_to_cart_button.html('Товар в корзине');
  add_to_cart_button.removeClass("btn-success btn-outline-success");
  add_to_cart_button.addClass("btn-warning");
  add_to_cart_button.attr('href', '/cart');
  add_to_cart_button.removeAttr('data-remote');
  add_to_cart_button.removeAttr('data-method');
  update_navbar_cart_link(data.farm_products_in_cart_size);
});
