class CoffeeShopSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :state, :zip, :description, :image_url

  has_many :reviews
end
