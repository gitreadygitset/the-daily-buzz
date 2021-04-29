class CoffeeShopSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :state, :zip, :description, :image_url, :average_rating
end
