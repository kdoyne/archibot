require 'spec_helper'

describe "a user can edit their account info" do
  let(:user) { FactoryGirl.create(:user) }

  it "lets a user edit their info" do

    login(user)
    click_link "My Profile"
    click_link "Edit My Info"
    fill_in :user_first_name, with:"Bob"
    click_button "Save Changes"
    expect(page).to have_content "Bob"

  end

  def login(user)
    visit root_path
    click_link "Login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"
  end

end
  