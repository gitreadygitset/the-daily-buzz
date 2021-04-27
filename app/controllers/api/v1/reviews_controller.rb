class Api::V1::ReviewsController < ApplicationController
before_action :authenticate_user!
before_action :authorize_user, except: [:create]
  def create
    review = Review.new(review_params)
    coffee_shop = CoffeeShop.find(params[:coffee_shop_id])
    review.coffee_shop = coffee_shop

    review.user = current_user
    
    if review.save
      render json: { review: review }
    else
      render json: { error: review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    render json: { message: "removed" }, status: :ok
  end
  
  protected

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def authorize_user
    if !user_signed_in? || !(current_user.role == "admin")
      render json: {error: ["Only admins have access to this feature"]}
    end
  end
end
