class CoffeeShop < ApplicationRecord
  validates :name, :address, :city, :state, :zip, presence: true
end
