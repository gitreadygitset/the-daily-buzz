class CoffeeShopsController < ApplicationController
  def index
    @coffee_shops = CoffeeShop.all
  end
end
