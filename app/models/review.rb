class Review < ApplicationRecord
  belongs_to :user
  belongs_to :coffee_shop

  has_many :user_votes
  has_many :users, through: :user_votes

  def score
    user_votes.count
  end

  validates :rating, numericality: { less_than_or_equal_to: 5 }
  validates :comment, length: { maximum: 500 }, allow_blank: true
end
