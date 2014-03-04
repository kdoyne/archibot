require 'spec_helper'

describe "a user can join the website" do
  
  it "creates a user and logs in, then logs out" do

    visit root_path
    click_link "Join Archibot"
    fill_in :user_email, with: "test@test.com"
    fill_in :user_first_name, with: "Test"
    fill_in :user_last_name, with: "Test"
    fill_in :user_password, with: "password"
    fill_in :user_password_confirmation, with: "password"
    click_button "Join!"

    expect(page).to have_content "Log Out Test"

    click_link "Log Out Test"
    expect(page).to have_content "Please Log In"

  end
end