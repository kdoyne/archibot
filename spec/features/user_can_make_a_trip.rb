require 'spec_helper'

describe "a user can make a trip" do
  let(:user) { FactoryGirl.create(:user) }

  let!(:frank) { Architect.create(name: "Frank Lloyd Wright", year_born: 1867 ,year_died: 1959,style: "Arts and Crafts") }
  let!(:will) { Architect.create(name: "William Van Alen", year_born: 1883, year_died: 1954, style: "Art Deco") }
  let!(:mies) { Architect.create(name: "Ludwig Mies van der Rohe", year_born: 1886, year_died: 1969, style: "Modern") }

  let!(:building_1) { Building.create(name: "Solomon R. Guggenheim Museum", address: "1071 5th Ave, New York, NY 10128", year_built: 1937, photo_url: "http://www.bc.edu/bc_org/avp/cas/fnart/fa267/flw/guggenheim03.jpg",architect: frank) }
  let!(:building_2) { Building.create(name: "Chrysler Building", address: "405 Lexington Avenue, Manhattan, New York 10174", year_built: 1928, photo_url: "http://wirednewyork.com/images/skyscrapers/chrysler-building/chrysler_top_close.jpg", architect: will) }
  let!(:building_3) { Building.create(name: "Seagram Building", address: "375 Park Ave, New York, 10152", year_built: 1958, photo_url: "http://ad009cdnb.archdaily.net/wp-content/uploads/2010/05/1273455816-nightshot.jpg", architect: mies) }

  it "can make a trip of multiple buildings" do

    login(user)

    visit root_path
    click_link "View the collection"
    click_link frank.name
    click_link "Buildings by this architect in the database"
    click_link building_1.name
    click_link "Create Trip" 
    fill_in :trip_title, with: "Trip 1"
    select building_1.name, from: "trip_buildings"
    select building_2.name, from: "trip_buildings"
    select building_3.name, from: "trip_buildings"
    click_button "Save Trip"
    click_link "My Profile"
    click_link "Trip 1"

    expect(page).to have_content building_1.name 

  end

  def login(user)
    visit root_path
    click_link "Login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"
  end

end