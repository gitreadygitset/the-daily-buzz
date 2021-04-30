require 'rails_helper'

feature "User can see a list of coffee shops on the index page" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:test_shop1) { FactoryBot.create(:coffee_shop, name: 'Farbucks', user: user) }
  let!(:review_1) { FactoryBot.create(:review, coffee_shop: test_shop1, user: user)}
  let!(:test_shop2) { FactoryBot.create(:coffee_shop, name: 'tarbucks', user: user) }
  let!(:review_2) { FactoryBot.create(:review, coffee_shop: test_shop2, user: user)}
  let!(:test_shop) { FactoryBot.create(:coffee_shop, user: user) }
  let!(:review_3) { FactoryBot.create(:review, coffee_shop: test_shop, user: user)}

  scenario "User visits index page" do
    visit coffee_shops_path
    expect(page).to have_content("Coffee Shops")
    expect(page).to have_content("Starbucks")
  end

  scenario "User clicks a link to visit a coffee shop page" do
    visit coffee_shops_path
    click_link test_shop.name

    expect(page).to have_current_path("/coffee_shops/#{test_shop.id}")
  end
end
