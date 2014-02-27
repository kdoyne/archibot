module MethodHelper

require 'addressable'
  # Finds buildings from freebase designed by the architect.
  def find_buildings(architect)
    name = architect.name
    url = Addressable::URI.parse('https://www.googleapis.com/freebase/v1/search')
    url.query_values = {
      query: name,
      type: "/architecture/structure",
      key: GOOGLE_CLIENT_ID
        }
    from_freebase = HTTParty.get(url, :format => :json)
    @results = from_freebase["result"]
    @buildings_designed = @results.map { |building| building["name"]}
  end

  # Gets a description of the architect - from wikipedia
  def get_description(architect)
    search = FreebaseAPI.session.search("#{architect.name}")
    resource_id = search[0]["id"]
    if resource_id == nil
      resource_id = search[0]["mid"]
    end
    resource = FreebaseAPI::Topic.get("#{resource_id}")
    @description = resource.description
  end

  # Gets buildings in the database within a 3 mile radius of the current building.
  def find_entries(building)
    @buildings_nearby = building.nearbys(3)
  end

  # Generates a google static map of the building and buildings nearby
  def get_map(building, array_of_buildings_nearby)
    each_result = array_of_buildings_nearby.map { |building| "markers=color:green%7Clabel:%7C#{building.latitude},#{building.longitude}&" }
    map_from_google = "http://maps.googleapis.com/maps/api/staticmap?center=#{building.latitude},#{building.longitude}&zoom=13&size=1300x1000&maptype=roadmap&markers=color:red%7Clabel:%7C#{building.latitude},#{building.longitude}&"+each_result.join+"sensor=false&key=#{GOOGLE_CLIENT_ID}"
    return map_from_google
  end

  # Pulls the instagram location that matches the name of the building and coordinates of the building
  def get_instagram_location_id(building)
    return_hash = HTTParty.get("https://api.instagram.com/v1/locations/search?lat=#{building.latitude}&lng=#{building.longitude}&distance=25&client_id=#{INSTAGRAM_CLIENT_ID}")
    data = return_hash["data"]
    location_hash = data.detect { |item| item["name"].include?(@building.name) }
    unless location_hash == nil
      location = location_hash["id"]
    end
  end

  # accomodates for buildings not returning an instagram location
  def pull_photos(building)
    @location = get_instagram_location_id(building)
    unless @location == nil
      @photos = get_instagram_photos(@location)
    end
  end

  # pulls 3 random photos from instagram tagged at the location
  def get_instagram_photos(location_id)
    return_hash = HTTParty.get("https://api.instagram.com/v1/locations/#{location_id}/media/recent?client_id=#{INSTAGRAM_CLIENT_ID}")
    @instagram_photos = [return_hash["data"].sample["images"]["low_resolution"]["url"], return_hash["data"].sample["images"]["low_resolution"]["url"],return_hash["data"].sample["images"]["low_resolution"]["url"]]
  end

  # pulls a description of the building from freebase - from Wikipedia
  def get_building_description(building)
    search = FreebaseAPI.session.search("#{building.name}")
    resource_id = search[0]["id"]
    resource = FreebaseAPI::Topic.get("#{resource_id}")
    @building_description = resource.description
  end  

  # Pulls photos for the splash page from instagram
  def get_photos
    tag = ["urbanlandscape","architecture","buildings","archidaily"].sample
    return_hash = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=#{INSTAGRAM_CLIENT_ID}")
    @instagram_photos = [return_hash["data"].sample["images"]["low_resolution"]["url"], return_hash["data"].sample["images"]["low_resolution"]["url"],return_hash["data"].sample["images"]["low_resolution"]["url"],
    return_hash["data"].sample["images"]["low_resolution"]["url"]]
  end

end
