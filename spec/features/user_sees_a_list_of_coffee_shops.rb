require 'rails_helper'

feature "User can see a list of coffee shops on the index page" do 
  
  let!(:test_shop_1){ CoffeeShop.create(name: "Starbucks", address: "123 Fake St.", city: "Boston", state: "MA", zip: "02169", description: "Best lattes in town would recommend to a friend.") }
  
  scenario "User visits index page" do 
    visit coffee_shops_path
    expect(page).to have_content("Coffee Shops")
    expect(page).to have_content("Starbucks")
  end
end
