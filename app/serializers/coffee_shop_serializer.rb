class CoffeeShopSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :state, :zip, :description, :image_url, :current_user, :average_rating

  has_many :reviews
end
