class CoffeeShopsController < ApplicationController
  def index
    @coffee_shops = CoffeeShop.all
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
