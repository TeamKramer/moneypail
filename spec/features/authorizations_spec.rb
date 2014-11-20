require 'rails_helper'

feature "Authorizations" do
 scenario "sign up" do
  
  create_user "test@test.com", "usertest"

  expect(page).to have_content("user account created")

 end
 
 scenario "log in" do

  create_user "test@test.com", "usertest"
  
  log_in_with "test@test.com", "usertest"

  expect(page).to have_content("Welcome test@test.com")

end

scenario "log out" do

  create_user "test@test.com", "usertest"
  log_in_with "test@test.com", "usertest"

  log_out

  expect(page).to have_content("You have sucessfully logged out")

end


def create_user username, password

  visit root_path

  click_on "Sign up"

  fill_in "email", with: username
  fill_in "password", with: password
  fill_in "password verification", with: password
  click_button "Sign up"
  user = User.find_by(email: username)
  user.confirm!
  
end

def log_in_with username, password

  visit root_path
  click_on "Sign in"
  fill_in "email", with: username
  fill_in "password", with: password
  click_button "Sign in"

end

def log_out

  visit root_path
  click_on "Sign Out"

end
end
