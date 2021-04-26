require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#create" do
    context "user is created correctly with required fields and parameters" do
      let!(:test_user_1) { FactoryBot.build(:user) }
      let!(:test_user_2) { FactoryBot.build(:user, role: "admin") }

      it "creates a new user" do

        expect(test_user_1.save).to eq(true)
      end
    end

    context "user is not created without required fields and incorrect parameters" do
      let!(:test_user_3) { FactoryBot.build(:user, role: "user") }
      let!(:test_user_4) { FactoryBot.build(:user, username: "") }
      
      it "does not create a new user if the required role is not 'member' or 'admin'" do

      it "does not create a new user if the required role is not 'member' or 'admin'" do
        
        expect(test_user_3.save).to eq(false)
      end

      it "does not create a new user if the username is blank" do
        
        expect(test_user_4.save).to eq(false)
      end
    end
  end
end
