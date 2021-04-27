require "rails_helper"

RSpec.describe Api::V1::ReviewsController, type: :controller do
  let!(:bob) { FactoryBot.create(:user) }
  let!(:test_shop) { FactoryBot.create(:coffee_shop, user: bob) }

  describe "POST#create" do
    it "receives review information which is persisted to the database" do
      sign_in bob
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
      sign_in bob
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

    it "shows an error message when fields are left blank" do
      sign_in bob
      post_json = {
        review: {
          rating: nil,
          comment: ""
        },
        coffee_shop_id: test_shop.id
      }

      post :create, params: post_json, format: :json
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 422
      expect(returned_json["error"][0]).to eq "Rating is not a number"
    end


    it "shows an error message when User is not signed in" do
      post_json = {
        review: {
          rating: 3,
          comment: "this place is crazy!! Wow!"
        },
        coffee_shop_id: test_shop.id
      }

      post :create, params: post_json, format: :json
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 401
      expect(returned_json["error"]).to eq("You need to sign in or sign up before continuing.")
    end

  end
end
