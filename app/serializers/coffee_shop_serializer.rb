class CoffeeShopSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :state, :zip, :description, :image_url, :current_user

  has_many :reviews
  has_many :user_votes
end
