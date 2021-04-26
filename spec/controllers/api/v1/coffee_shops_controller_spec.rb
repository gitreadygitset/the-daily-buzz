require "rails_helper"

RSpec.describe Api::V1::CoffeeShopsController, type: :controller do
  test_shop = FactoryBot.create(:coffee_shop)
  review1 = FactoryBot.create(:review, coffee_shop: test_shop)
  review2 = FactoryBot.create(:review, coffee_shop: test_shop)
  review3 = FactoryBot.create(:review, coffee_shop: test_shop)
  review4 = FactoryBot.create(:review, coffee_shop: test_shop)


  describe "GET#show" do
    it "Should return a coffee shop and its reviews" do

      get :show, params: {id: test_shop.id}
      returned_json = JSON.parse(response.body)

      expect(returned_json["coffee_shop"]["name"]).to eq("Starbucks")
      expect(returned_json["coffee_shop"]["address"]).to eq("123 Fake St.")
      expect(returned_json["coffee_shop"]["city"]).to eq("Boston")
      expect(returned_json["coffee_shop"]["state"]).to eq("MA")
      expect(returned_json["coffee_shop"]["zip"]).to eq("02135")
      expect(returned_json["coffee_shop"]["description"]).to eq("Best lattes in town would recommend to a friend.")
      expect(returned_json["coffee_shop"]["image_url"]).to eq(nil)
      expect(returned_json["coffee_shop"]["reviews"].length).to eq(4)

    end
  end
end