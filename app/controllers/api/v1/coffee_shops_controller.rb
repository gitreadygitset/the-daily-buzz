class Api::V1::CoffeeShopsController < ApplicationController
  def show
    shop = CoffeeShop.find(params[:id])
    reviews = shop.reviews.sort_by(&:created_at).map do |review|
      ActiveModelSerializers::SerializableResource.new(review, {serializer: ReviewsSerializer})
    end
    render json: {
      coffee_shop: CoffeeShopSerializer.new(shop),
      reviews: reviews,
      current_user: current_user,
      }
  end
end
