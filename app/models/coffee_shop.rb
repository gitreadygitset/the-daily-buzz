class CoffeeShop < ApplicationRecord
  validates :name, :address, :city, :state, :zip, presence: true
  validates :description, length: {minimum: 20 }, allow_blank: true
  validates :zip, length: {is: 5}

  has_many :reviews

  belongs_to :user
end
