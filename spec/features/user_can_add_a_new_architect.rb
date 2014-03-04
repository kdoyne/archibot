require 'spec_helper'

describe "a user can add a new architect to the database" do
  let(:user) { FactoryGirl.create(:user) }

  it "adds a new architect" do

    login(user)
    click_link "Home"
    click_link "View the collection"
    click_link "Add a new architect"
    fill_in :architect_name, with: "Frank Lloyd Wright"
    fill_in :architect_style, with: "Usonian"
    fill_in :architect_year_born, with: 1867
    fill_in :architect_year_died, with: 1958
    click_button "Create Architect"
    expect(page).to have_content "Frank Lloyd Wright"

  end


  def login(user)
    visit root_path
    click_link "Login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"
  end
end