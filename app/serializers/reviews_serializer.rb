class ReviewsSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comment, :score, :created_at

  has_one :user
end
