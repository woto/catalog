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
//= require wnumb/wNumb
//= require slick/slick/slick
//= require zoom/jquery.zoom
//
//= require farm/products
//= require farm/search
//= require farm/cart

$(document).on('turbolinks:load', function(){
  Holder.addTheme("thumb", { background: "#55595c", foreground: "#eceeef", text: "Thumbnail" });
  Holder.run();
})
