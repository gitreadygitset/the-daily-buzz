require "rails_helper"

RSpec.describe Api::V1::CoffeeShopController, type: :controller do
  test_shop = FactoryBot.create(:coffee_shop)
  review1 = FactoryBot.create(:reviews, coffee_shop: test_shop)
  review2 = FactoryBot.create(:reviews, coffee_shop: test_shop)
  review3 = FactoryBot.create(:reviews, coffee_shop: test_shop)
  review4 = FactoryBot.create(:reviews, coffee_shop: test_shop)


  describe "GET#show" do
    it "Should return a coffee shop and its reviews" do

      get :show, params: {id: test_shop.id}
      returned_json = JSON.parse(response.body)

      binding.pry

    end
  end
end
