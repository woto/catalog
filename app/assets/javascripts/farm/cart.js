var update_input_count = function(){
  var id = $(this).closest('.js-cart-products__row').data('id');
  var val = $(this).val();
  $.ajax({
    url: "/cart",
    type: "PATCH",
    data: {
      product_id: id,
      count: val
    },
    dataType: 'json'
  }).done(function(data){
    if(data.farm_total_cost_of_products_in_cart.integer == 0) {
      update_navbar_cart_link('');
      Turbolinks.clearCache();
      Turbolinks.visit('/cart');
    } else {
      update_navbar_cart_link(data.farm_products_in_cart_size)
      $('#js-cart-products__total').text(data.farm_total_cost_of_products_in_cart.string)
      $('.js-cart-products__row[data-id="'+id+'"] .js-cart-products__sum').text(data.farm_products_sum)
    }
  });
}

$(document).on('click', '.js-cart-products__calc', function(){
  var $row = $(this).closest('.js-cart-products__row')
  var $input = $row.find('.js-cart-products__input-count');
  var operator = $(this).data('operator');
  var value = eval($input.val() + operator + 1)
  var routine = function(){
    $input.val(value);
    var call = $.proxy(update_input_count, $input);
    call();
  }
  if(value > 0){
    routine();
  } else if(confirm('Удалить товар из корзины?')) {
    routine();
    $row.remove();
  }
})

$(document).on('propertychange change click keyup input paste', '.js-cart-products__input-count', update_input_count)
