class Api::V1::ReviewsController < ApplicationController

  def create
    review = Review.new(review_params)
    coffee_shop = CoffeeShop.find(params[:coffee_shop_id])
    review.coffee_shop = coffee_shop
    
    if review.save
      render json: { review: review }
    else
      render json: { error: review.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end