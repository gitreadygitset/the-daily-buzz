require 'rails_helper'

feature "User visits the root page of the site" do

  scenario "Root page loads for user and banner is shown" do
    visit "/"
    expect(page).to have_content("TheDailyBuzz")
    expect(page).to have_xpath("/")
  end
end
