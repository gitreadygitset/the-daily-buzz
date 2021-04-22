require 'rails_helper'

RSpec.describe Api::V1::CoffeeShopsController, type: :controller do
  shop_1 = FactoryBot.create(:coffee_shop)
  review_1 = FactoryBot.create(:review, coffee_shop: shop_1)
  review_2 = FactoryBot.create(:review, coffee_shop: shop_1)
  review_3 = FactoryBot.create(:review, coffee_shop: shop_1)
  review_4 = FactoryBot.create(:review, coffee_shop: shop_1)

  describe "GET#show" do
    it "should return a list of all the gifs" do

      get :show, params: {id: shop_1.id}
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json['coffee_shop']['name']).to eq('Starbucks')
      expect(returned_json['coffee_shop']['address']).to eq("123 Fake St.")
      expect(returned_json['coffee_shop']['city']).to eq("Boston")
      expect(returned_json['coffee_shop']['state']).to eq('MA')
      expect(returned_json['coffee_shop']['zip']).to eq("02135")
      expect(returned_json['coffee_shop']['description']).to eq("Best lattes in town would recommend to a friend.")
      expect(returned_json['coffee_shop']['image_url']).to eq(nil)
      expect((returned_json['coffee_shop']['reviews']).length).to eq(4)


    end
  end
end
