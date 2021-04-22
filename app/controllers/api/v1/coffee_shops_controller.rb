class Api::V1::CoffeeShopsController < ApplicationController
  def show
    coffee_shop = CoffeeShop.find(params[:id])
    review_list = coffee_shop.reviews.order(created_at: :desc).limit(10)
    render json: {coffee_shop: coffee_shop, reviews: review_list}
  end
end