class CoffeeShop < ApplicationRecord
  validates :name, :address, :city, :state, :zip, presence: true
  validates :description, length: {minimum: 20 }, allow_blank: true
  validates :zip, length: {is: 5}

  has_many :reviews
  belongs_to :user

  def average_rating
    rating_array = reviews.map do |review|
      review.rating
    end
    (rating_array.sum.to_f / rating_array.length).round(1)
  end
end
