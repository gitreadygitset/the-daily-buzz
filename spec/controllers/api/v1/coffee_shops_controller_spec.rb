require "rails_helper"

RSpec.describe Api::V1::CoffeeShopsController, type: :controller do

  let!(:test_shop) { FactoryBot.create(:coffee_shop, user: user) }
  let!(:user) { FactoryBot.create(:user) }
  let!(:review1) { FactoryBot.create(:review, coffee_shop: test_shop, user: user) }
  let!(:review2) { FactoryBot.create(:review, coffee_shop: test_shop, user: user) }
  let!(:review3) { FactoryBot.create(:review, coffee_shop: test_shop, user: user) }
  let!(:review4) { FactoryBot.create(:review, coffee_shop: test_shop, user: user) }

  describe "GET#show" do
    it "Should return a coffee shop and its reviews" do
      sign_in user
      get :show, params: {id: test_shop.id}
      returned_json = JSON.parse(response.body)

      expect(returned_json["coffee_shop"]["address"]).to eq("123 Fake St.")
      expect(returned_json["coffee_shop"]["city"]).to eq("Boston")
      expect(returned_json["coffee_shop"]["state"]).to eq("MA")
      expect(returned_json["coffee_shop"]["zip"]).to eq("02135")
      expect(returned_json["coffee_shop"]["description"]).to eq("Best lattes in town would recommend to a friend.")
      expect(returned_json["coffee_shop"]["image_url"]).to eq(nil)
      expect(returned_json["coffee_shop"]["reviews"].length).to eq(4)
      expect(returned_json["coffee_shop"]["current_user"]["username"]).to eq("GuestMember123")

    end
  end
end
