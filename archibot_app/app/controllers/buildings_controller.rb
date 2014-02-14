class BuildingsController < ApplicationController
  before_action :load_architect, only: [:index, :show, :edit, :create, :new, :destroy]
  before_action :load_building, only: [:show, :edit, :destroy, :update]

  def index
    @buildings = Building.where(architect_id: params[:architect_id])
  end

  def show
    @buildings = Building.where(architect_id: params[:architect_id])
    find_entries(@building)
    @map = get_map(@building,@results)
    @location = get_instagram_location_id(@building)
    unless @location == nil
    @photos = get_instagram_photos(@location)
  end
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(user_params)
    @building.architect = @architect
    @building.save
    redirect_to architect_buildings_path
  end

  def edit
  end

  def update
    @building.update(user_params)
    redirect_to architect_building_path
  end

  def destroy
    @building.destroy
    redirect_to architect
  end

private

  def user_params
    params.require(:building).permit(:name, :address, :year_built, :photo_url)
  end

  def load_architect
    @architect = Architect.find(params[:architect_id])
  end

  def load_building
    @building = Building.find(params[:id])
  end

  def find_entries(building)
    @results = building.nearbys(3)
  end

  def get_map(building, array)
    each_result = array.map do |building| "markers=color:green%7Clabel:G%7C#{building.latitude},#{building.longitude}&" end

      map_from_google = "http://maps.googleapis.com/maps/api/staticmap?center=#{building.latitude},#{building.longitude}&zoom=13&size=1600x1300&maptype=roadmap&markers=color:red%7Clabel:S%7C#{building.latitude},#{building.longitude}&"+each_result.join+"sensor=false&key=#{GOOGLE_CLIENT_ID}"
    return map_from_google
  end

  def get_instagram_location_id(building)
    return_hash = HTTParty.get("https://api.instagram.com/v1/locations/search?lat=#{building.latitude}&lng=#{building.longitude}&distance=25&client_id=#{INSTAGRAM_CLIENT_ID}")
    data = return_hash["data"]
    location_hash = data.detect do |item| item["name"].include?(@building.name) end
      unless location_hash == nil
    location = location_hash["id"]
  end
  end

  def get_instagram_photos(location_id)
    return_hash = HTTParty.get("https://api.instagram.com/v1/locations/#{location_id}/media/recent?client_id=#{INSTAGRAM_CLIENT_ID}")
    @instagram_photos = [return_hash["data"].sample["images"]["low_resolution"]["url"], return_hash["data"].sample["images"]["low_resolution"]["url"],return_hash["data"].sample["images"]["low_resolution"]["url"]]
  end


end