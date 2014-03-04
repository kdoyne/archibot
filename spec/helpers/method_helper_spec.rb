require 'spec_helper'

describe MethodHelper do
  
  describe "#find_buildings(architect)" do
    let!(:frank) { Architect.create(name: "Frank Lloyd Wright", year_born: 1867 ,year_died: 1959,style: "Arts and Crafts") }

    it "finds a list of buildings designed by an architect" do
      expect(find_buildings(frank)).to be_kind_of(Array)
    end
  end

  describe "#get_description(architect)" do
    let!(:frank) { Architect.create(name: "Frank Lloyd Wright", year_born: 1867 ,year_died: 1959,style: "Arts and Crafts") }

    it "finds a description for an architect" do
      expect(get_description(frank)).to be_kind_of(String)
    end
  end

  describe "#get_map(building, array_of_buildings_nearby)" do
    let!(:frank) { Architect.create(name: "Frank Lloyd Wright", year_born: 1867 ,year_died: 1959,style: "Arts and Crafts") }
    let!(:building_1) { Building.create(name: "Solomon R. Guggenheim Museum", address: "1071 5th Ave, New York, NY 10128", year_built: 1937, photo_url: "http://www.bc.edu/bc_org/avp/cas/fnart/fa267/flw/guggenheim03.jpg",architect: frank) }  

    it "returns a map of the buildings" do
      expect(get_map(building_1, [])).to be_kind_of(String)
    end
  end

  describe "#get_instagram_location_id(building)" do
    let!(:frank) { Architect.create(name: "Frank Lloyd Wright", year_born: 1867 ,year_died: 1959,style: "Arts and Crafts") }
    let!(:building_1) { Building.create(name: "Solomon R. Guggenheim Museum", address: "1071 5th Ave, New York, NY 10128", year_built: 1937, photo_url: "http://www.bc.edu/bc_org/avp/cas/fnart/fa267/flw/guggenheim03.jpg",architect: frank) }  

    it "gets the instagram location for a building" do
      @building = building_1
      expect(get_instagram_location_id(building_1)).to be_kind_of(String)
    end
  end

  describe "#pull_photos(building)" do
    let!(:frank) { Architect.create(name: "Frank Lloyd Wright", year_born: 1867 ,year_died: 1959,style: "Arts and Crafts") }
    let!(:building_1) { Building.create(name: "Solomon R. Guggenheim Museum", address: "1071 5th Ave, New York, NY 10128", year_built: 1937, photo_url: "http://www.bc.edu/bc_org/avp/cas/fnart/fa267/flw/guggenheim03.jpg",architect: frank) }  

    it "gets photos from instagram taken at a specific location" do
      @building = building_1
      expect(pull_photos(building_1)).to be_kind_of(Array)
    end
  end

  describe "#get_instagram_photos(location_id)" do
    let!(:frank) { Architect.create(name: "Frank Lloyd Wright", year_born: 1867 ,year_died: 1959,style: "Arts and Crafts") }
    let!(:building_1) { Building.create(name: "Solomon R. Guggenheim Museum", address: "1071 5th Ave, New York, NY 10128", year_built: 1937, photo_url: "http://www.bc.edu/bc_org/avp/cas/fnart/fa267/flw/guggenheim03.jpg",architect: frank) }  

    it "gets photos from a location" do
      @building = building_1
      location = get_instagram_location_id(building_1)
      expect(get_instagram_photos(location)).to be_kind_of(Array)
    end
  end

  describe "#get_building_description(building)" do
    let!(:frank) { Architect.create(name: "Frank Lloyd Wright", year_born: 1867 ,year_died: 1959,style: "Arts and Crafts") }
    let!(:building_1) { Building.create(name: "Solomon R. Guggenheim Museum", address: "1071 5th Ave, New York, NY 10128", year_built: 1937, photo_url: "http://www.bc.edu/bc_org/avp/cas/fnart/fa267/flw/guggenheim03.jpg",architect: frank) }  

    it "gets a description of the building" do
      expect(get_building_description(building_1)).to be_kind_of(String)
    end
  end

  describe "#get_photos" do
    it "gets random photos from instagram" do
      expect(get_photos).to be_kind_of(Array)
    end
  end


end









