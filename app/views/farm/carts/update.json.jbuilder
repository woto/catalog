json.farm_products_sum number_to_currency(@sum, precision: 0)
json.farm_total_cost_of_products_in_cart do
  json.string number_to_currency(farm_total_cost_of_products_in_cart, precision: 0)
  json.integer farm_total_cost_of_products_in_cart
end
json.farm_products_in_cart_size farm_products_in_cart.size
