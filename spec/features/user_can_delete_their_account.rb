require 'spec_helper'

describe "users can delete their account" do
  let(:user) { FactoryGirl.create(:user) }

  it "lets users delete their account" do

    login(user)
    click_link "My Profile"
    click_button "Delete Account"
    expect(page).to have_content "Welcome to Archibot!"

    click_link "Login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"
    expect(page).to_not have_content "Favorite Buildings"

  end

  def login(user)
    visit root_path
    click_link "Login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"
  end

end
