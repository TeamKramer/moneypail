require 'rails_helper'

feature "Authorizations" do
  scenario "sign up" do

    create_user "test@test.com", "usertest"

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "log in" do

    create_user "test@test.com", "usertest"
    log_out

    log_in_with "test@test.com", "usertest"

    expect(page).to have_content("Signed in successfully.")

  end

  scenario "log out" do

    create_user "test@test.com", "usertest"
    log_out

    log_in_with "test@test.com", "usertest"
    log_out

    expect(page).to have_content("Signed out successfully.")

  end


  def create_user username, password

    visit root_path

    click_on "Sign up"

    fill_in "Email", with: username
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_button "Sign up"
    # user = User.find_by(email: username)
    # user.confirm!

  end

  def log_in_with username, password

    visit root_path
    click_on "Login"
    fill_in "Email", with: username
    fill_in "Password", with: password
    click_button "Sign in"

  end

  def log_out

    visit root_path
    click_on "Logout"

  end
end
