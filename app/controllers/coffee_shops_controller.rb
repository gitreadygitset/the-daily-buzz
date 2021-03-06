class CoffeeShopsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @coffee_shops = CoffeeShop.order(:name)
    @top_shop = @coffee_shops.sort { |b,a| a.average_rating <=> b.average_rating }[0]
  end

  def new
    @coffee_shop = CoffeeShop.new
  end

  def create
    @coffee_shop = CoffeeShop.new(coffee_shop_params)
    @coffee_shop.user = current_user
    if @coffee_shop.save
      redirect_to "/coffee_shops/#{@coffee_shop.id}", notice: 'Coffee Shop Added'
    else
      flash.now[:error] = @coffee_shop.errors.to_hash(true)
      render :new
    end
  end

  private

  def coffee_shop_params
    params.require(:coffee_shop).permit(:name, :address, :city, :state, :zip, :description, :image_url)
  end
end
