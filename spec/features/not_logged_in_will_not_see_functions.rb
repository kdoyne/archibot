require 'spec_helper'

describe "a not-logged in user will not seee certain functions" do
  let!(:frank) { Architect.create(name: "Frank Lloyd Wright", year_born: 1867 ,year_died: 1959,style: "Arts and Crafts") }
  let!(:building_1) { Building.create(name: "Solomon R. Guggenheim Museum", address: "1071 5th Ave, New York, NY 10128", year_built: 1937, photo_url: "http://www.bc.edu/bc_org/avp/cas/fnart/fa267/flw/guggenheim03.jpg",architect: frank) }

  it "does not show edit buttons" do

    visit root_path
    click_link "View the collection"
    click_link frank.name
    expect(page).to_not have_link "Edit this architect"

    click_link "Buildings by this architect in the database"
    click_link building_1.name
    expect(page).to_not have_link "edit"
    expect(page).to_not have_link "favorite"
    expect(page).to_not have_link "unfavorite"
    expect(page).to_not have_link "Create Trip"

  end
end