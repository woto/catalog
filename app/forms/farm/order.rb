class Farm::Order
  attr_accessor :name, :phone, :address

  validates :presence, :name, :phone, :address
end
