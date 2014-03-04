require 'spec_helper'

describe "a user can edit an architect's info" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:frank) { Architect.create(name: "Frank Lloyd Wright", year_born: 1867 ,year_died: 1959,style: "Arts and Crafts") }

  it "edits an architect" do

    login(user)
    click_link "Home"
    click_link "View the collection"
    click_link frank.name
    click_link "Edit this architect"
    fill_in :architect_name, with: "Susan B. Anthony"
    click_button "Update Architect"
    expect(page).to have_content "Susan B. Anthony"

  end

  def login(user)
    visit root_path
    click_link "Login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"
  end
end