class Api::V1::CoffeeShopsController < ApplicationController
  def show
    render json: CoffeeShop.find(params[:id])
  end
end
