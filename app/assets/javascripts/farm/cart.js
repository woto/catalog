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
    $('#js-cart-products__total').text(data['total'])
    $('.js-cart-products__row[data-id="'+id+'"] .js-cart-products__sum').text(data['sum'])
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
