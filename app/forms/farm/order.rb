class Farm::Order
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :name, :phone, :address, :email
  validates_presence_of :name, :phone, :email
end
