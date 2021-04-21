require 'rails_helper'

RSpec.describe CoffeeShop, type: :model do
  test_shop_1 = FactoryBot.create(:coffee_shop)
  test_shop_2 = FactoryBot.build(:coffee_shop, name: "" )
  

  describe "#create" do
      context "Coffee Shop is created correctly with required fields and parameters" do
        it "creates a new coffee shop" do
          expect(test_shop_1.name).to eq("Starbucks")
          expect(test_shop_1.address).to eq("123 Fake St.")
          expect(test_shop_1.city).to eq("Boston")
          expect(test_shop_1.state).to eq("MA")
          expect(test_shop_1.zip).to eq("02135")
          expect(test_shop_1.description).to eq("Best lattes in town would recommend to a friend.")
        end
      end

      context "Coffee Shop is not created without required fields and parameters" do
        test_shop_4 = FactoryBot.build(:coffee_shop, zip: "02" )
        test_shop_5 = FactoryBot.build(:coffee_shop, zip: "021456")
        test_shop_6 = FactoryBot.build(:coffee_shop, description: "This is short" )

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
  end

