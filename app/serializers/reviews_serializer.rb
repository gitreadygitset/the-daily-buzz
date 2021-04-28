class ReviewsSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comment, :created_at

  has_one :user
end

