require 'rails_helper'
# require 'capybara/rails'

#Given moneypail exists
#When I am on the home page
#Then I can see a welcome message

feature "SmokeTest" do
  scenario "see welcome page" do
    visit 'welcome#index'

    expect(page).to have_content("Moneypail")
  end
end
