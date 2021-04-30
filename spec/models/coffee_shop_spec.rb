require 'rails_helper'

RSpec.describe CoffeeShop, type: :model do
  let!(:bob) { FactoryBot.create(:user)}
  let!(:test_shop_1) { FactoryBot.create(:coffee_shop, user: bob) }
  let!(:test_shop_2) { FactoryBot.build(:coffee_shop, name: "", user: bob) }
  let!(:review_1) { FactoryBot.create(:review, rating: 4, coffee_shop: test_shop_1, user: bob) }
  let!(:review_2) { FactoryBot.create(:review, rating: 5, coffee_shop: test_shop_1, user: bob) }
  let!(:review_3) { FactoryBot.create(:review, rating: 2, coffee_shop: test_shop_1, user: bob) }


  describe "#create" do
      context "Coffee Shop is created correctly with required fields and parameters" do
        it "creates a new coffee shop" do
          expect(test_shop_1.name).to eq("Starbucks")
          expect(test_shop_1.address).to eq("123 Fake St.")
          expect(test_shop_1.city).to eq("Boston")
          expect(test_shop_1.state).to eq("Massachusetts")
          expect(test_shop_1.zip).to eq("02135")
          expect(test_shop_1.description).to eq("Best lattes in town would recommend to a friend.")
        end
      end

      context "Coffee Shop is not created without required fields and parameters" do
        let!(:test_shop_4) { FactoryBot.build(:coffee_shop, zip: "02", user: bob) }
        let!(:test_shop_5) { FactoryBot.build(:coffee_shop, zip: "021456", user: bob) }
        let!(:test_shop_6) { FactoryBot.build(:coffee_shop, description: "This is short", user: bob) }

        it "does not create a new coffee shop if a required attribute is missing" do
          expect(test_shop_2.save).to eq(false)
        end

        it "does not create a new coffee shop if the zip code is not 5 digits" do
          expect(test_shop_4.save).to eq(false)
          expect(test_shop_5.save).to eq(false)
        end

        it "does not create a new coffee shop if the description is shorter than 20 characters" do

          expect(test_shop_6.save).to eq(false)
        end
      end
    end
    describe '#average_rating' do
      context 'Coffee shop has many reviews' do
        it 'returns the average of all reviews' do
          expect(test_shop_1.average_rating).to eq(3.7)
        end
      end
    end
  end

