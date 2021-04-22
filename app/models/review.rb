class Review < ApplicationRecord
  
  validates :rating, numericality: { less_than_or_equal_to: 5 } 
  validates :comment, length: { maximum: 500 }, allow_blank: true
  
  belongs_to :coffee_shop
end