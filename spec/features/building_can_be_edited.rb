require 'spec_helper'

describe "a user can edit an building's info" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:frank) { Architect.create(name: "Frank Lloyd Wright", year_born: 1867 ,year_died: 1959,style: "Arts and Crafts") }
  let!(:building_1) { Building.create(name: "Solomon R. Guggenheim Museum", address: "1071 5th Ave, New York, NY 10128", year_built: 1937, photo_url: "http://www.bc.edu/bc_org/avp/cas/fnart/fa267/flw/guggenheim03.jpg",architect: frank) }  


  it "edits a building" do

    login(user)
    click_link "Home"
    click_link "View the collection"
    click_link frank.name
    click_link "Buildings by this architect in the database"
    click_link building_1.name
    click_link "edit"
    fill_in :building_name, with: "Susan B. Anthony"
    click_button "Update Building"
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