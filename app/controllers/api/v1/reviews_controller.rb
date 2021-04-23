class Api::V1::ReviewsController < ApplicationController

  # def new
  #   review = Review.new
  #   coffee_shop = CoffeeShop.find(params[:coffee_shop_id])
  # end

  def create
    review = Review.new(review_params)
    coffee_shop = CoffeeShop.find(params[:coffee_shop_id])
    review.coffee_shop = coffee_shop
    
    if review.save
      render json: { review: review }
    else 
      render json: { error: fortune.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end