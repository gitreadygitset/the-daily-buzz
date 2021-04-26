require "rails_helper"

RSpec.describe Api::V1::CoffeeShopsController, type: :controller do

  let!(:test_shop) { FactoryBot.create(:coffee_shop) }
  let!(:review1) { FactoryBot.create(:review, coffee_shop: test_shop) }
  let!(:review2) { FactoryBot.create(:review, coffee_shop: test_shop) }
  let!(:review3) { FactoryBot.create(:review, coffee_shop: test_shop) }
  let!(:review4) { FactoryBot.create(:review, coffee_shop: test_shop) }

  describe "GET#show" do
    it "Should return a coffee shop and its reviews" do

      get :show, params: {id: test_shop.id}
      returned_json = JSON.parse(response.body)

    end
  end
end
