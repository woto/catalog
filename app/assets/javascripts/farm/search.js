//$(document).on('turbolinks:render', function(){

var debounced_hide;
var $popup_hint;

document.addEventListener("turbolinks:load", function() {
  if(debounced_hide) {
    debounced_hide.cancel()
  }
  $popup_hint = $('#filter-popup-hint');
  var hide = function(){
    $popup_hint.css({
      display: 'none'
    })
  }
  debounced_hide = _.debounce(hide, 5000);
})

var get_filter_criteria = function(){
  var category_id = new URI().search(true)['category_id']
  var category_serialized = "";
  if(category_id){
    category_serialized = "category_id=" + category_id;
  }

  var check_boxes_serialized = $('.js-filter-control.js-filter-check-box').serialize();

  var search_input_serialized = $('.js-filter-control.js-filter-text-input.js-filter-search').serialize();

  var text_inputs_serialized = {};

  // TODO Если все будет правильно работать, то отрефакторить
  var range_val, input_val, param_val, $input;

  $input = $('.js-filter-control.js-filter-text-input.js-filter-price.min-price-input');
  range_val = parseInt($input.data('price-range'), 10);
  input_val = parseInt($input.val(), 10);
  param_val = parseInt(new URI().search(true)['min_price'], 10);

  if($input.data('changed')){
    if(input_val != range_val) {
      text_inputs_serialized.min_price = input_val;
    } else {
      delete text_inputs_serialized.min_price;
    }
  } else if(param_val) {
    text_inputs_serialized.min_price = param_val;
  }

  // TODO Этот блок такой же как и чуть выше, только с max
  $input = $('.js-filter-control.js-filter-text-input.js-filter-price.max-price-input');
  range_val = parseInt($input.data('price-range'), 10);
  input_val = parseInt($input.val(), 10);
  param_val = parseInt(new URI().search(true)['max_price'], 10);

  if($input.data('changed')){
    if(input_val != range_val) {
      text_inputs_serialized.max_price = input_val;
    } else {
      delete text_inputs_serialized.max_price;
    }
  } else if(param_val) {
    text_inputs_serialized.max_price = param_val;
  }

  return "?" + _.without([check_boxes_serialized, $.param(text_inputs_serialized), category_serialized, search_input_serialized], '').join("&");
}

var show_filter_popup = function(handler){
  $popup_hint.html("<a href='" + get_filter_criteria() + "'>Найдено X товаров. Показать</a>");
  $popup_hint.css({
    display: 'block',
    left: $('.tether-width').offset().left + $('.tether-width').width(),
    top: $(handler).offset().top + $(handler).outerHeight()/2 - $popup_hint.outerHeight()/2
  });
  debounced_hide();
}

$(document).on('click', '.js-filter-click-handler', function(){
  show_filter_popup(this);
})

document.addEventListener("turbolinks:before-cache", function() {
  var slider = document.querySelector('.price-slider');
  if(slider) {
    slider.outerHTML = "<div class='price-slider m-t-1'></div>";
  }
})

document.addEventListener("turbolinks:load", function() {
  var slider = document.querySelector('.price-slider');
  if(slider) {
    var $min_price_input = $('.js-filter-control.js-filter-text-input.js-filter-price.min-price-input');
    var $max_price_input = $('.js-filter-control.js-filter-text-input.js-filter-price.max-price-input');
    var min_price_range = parseInt($min_price_input.data('price-range'), 10);
    var max_price_range = parseInt($max_price_input.data('price-range'), 10);
    var min_price_value = parseInt($min_price_input.val(), 10) || min_price_range;
    var max_price_value = parseInt($max_price_input.val(), 10) || max_price_range;

    var price_slider = noUiSlider.create(slider, {
      start: [min_price_value, max_price_value],
      connect: true,
      range: {
        'min': min_price_range - 0.0001,
        'max': max_price_range + 0.0001
      },
      //tooltips: [ wNumb({ decimals: 1 }), wNumb({ decimals: 1 }) ],
    });

    price_slider.on('set', function(values, handle){
      var value = parseInt(values[handle]);
      if(!handle) {
        $min_price_input.data('changed', true);
      } else {
        $max_price_input.data('changed', true);
      }
      show_filter_popup(this.target);
    });

    price_slider.on('update', function( values, handle ) {
      var value = parseInt(values[handle]);
      if(!handle) {
        //debugger;
        $min_price_input.val(value);
      }
      else {
        //debugger;
        $max_price_input.val(value);
      }
    });

    $min_price_input.on('change', function(){
      price_slider.set([parseInt(this.value, 0), null]);
    });

    $max_price_input.on('change', function(){
      price_slider.set([null, parseInt(this.value, 0)]);
    });
  }
});
