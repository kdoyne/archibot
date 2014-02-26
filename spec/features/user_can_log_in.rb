require 'spec_helper'

describe "a user can log in" do
  let!(:user) { FactoryGirl.create(:user) }

  it "can log in and show the user page" do
    visit root_path
    click_link "Login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"

    expect(page).to have_content user.email
  end
end
