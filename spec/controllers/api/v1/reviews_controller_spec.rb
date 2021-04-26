require "rails_helper"

RSpec.describe Api::V1::ReviewsController, type: :controller do
  !let(:test_shop) { FactoryBot.create(:coffee_shop) }


  describe "POST#create" do
    it "receives review information which is persisted to the database" do
      post_json = {
        review: {
          rating: 3,
          comment: "Place is great. Would recommend to a friend!!"
        },
        coffee_shop_id: test_shop.id
      }

      prev_count = Review.count
      post :create, params: post_json, format: :json
      returned_json = JSON.parse(response.body)
      expect(Review.count).to eq(prev_count + 1)
    end

    it "returns the json and id of the review" do
      post_json = {
        review: {
          rating: 3,
          comment: "Place is great. Would recommend to a friend!!"
        },
        coffee_shop_id: test_shop.id
      }

      post :create, params: post_json, format: :json
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json["review"]["id"]).to_not eq(nil)
      expect(returned_json["review"]["rating"]).to eq 3
      expect(returned_json["review"]["comment"]).to eq "Place is great. Would recommend to a friend!!"
    end
  end
end
