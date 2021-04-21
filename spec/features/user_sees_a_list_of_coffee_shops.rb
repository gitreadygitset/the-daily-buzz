require 'rails_helper'

feature "User can see a list of coffee shops on the index page" do 
  
  test_shop = FactoryBot.build(:coffee_shop)
  
  scenario "User visits index page" do 
    visit coffee_shops_path
    expect(page).to have_content("Coffee Shops")
    expect(page).to have_content("Starbucks")
  end
end
