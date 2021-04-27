require 'rails_helper'

feature "User adds a new coffee shop" do
  let!(:bob) { FactoryBot.create(:user) }
  scenario "User visits the index page and clicks on a link to go to the new coffee shop form" do
    login_as(bob)
    visit coffee_shops_path
    click_link("Click here to add it!")
    expect(page).to have_content("Add Your Favorite Coffee Shop")
  end

  scenario "User correctly fills out the form and submits a coffee shop" do
    shop_count = CoffeeShop.count
    login_as(bob)
    visit new_coffee_shop_path
    fill_in 'Name', with: "Fuel"
    fill_in 'Address', with: "152 Chestnut Hill Ave."
    fill_in 'City', with: "Brighton"
    fill_in 'State', with: "MA"
    fill_in 'Zip', with: "02135"
    click_button 'Add Coffee Shop'

    expect(CoffeeShop.count).to eq(shop_count+1)
    expect(page).to have_current_path("/coffee_shops/#{CoffeeShop.last.id}")
    expect(page).to have_content('Coffee Shop Added')
  end

  scenario "User incorrectly fills out the form and submits a coffee shop" do
    shop_count = CoffeeShop.count
    login_as(bob)
    visit new_coffee_shop_path
    fill_in 'Description', with: 'the'
    click_button 'Add Coffee Shop'

    expect(CoffeeShop.count).to eq(shop_count)
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Address can't be blank")
    expect(page).to have_content("City can't be blank")
    expect(page).to have_content("State can't be blank")
    expect(page).to have_content("Zip can't be blank")
    expect(page).to have_content("Description is too short (minimum is 20 characters)")
  end
end
