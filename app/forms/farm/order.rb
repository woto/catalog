class Farm::Order
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :name, :phone, :address
  validates_presence_of :name, :phone, :address
end
