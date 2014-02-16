class SplashController < ApplicationController
  def index
    @photos = get_photos
  end

  private

  def get_photos
    tag = ["urbanlandscape","architecture","buildings","archidaily"].sample
    return_hash = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=#{INSTAGRAM_CLIENT_ID}")
    @instagram_photos = [return_hash["data"].sample["images"]["low_resolution"]["url"], return_hash["data"].sample["images"]["low_resolution"]["url"],return_hash["data"].sample["images"]["low_resolution"]["url"],
      return_hash["data"].sample["images"]["low_resolution"]["url"],return_hash["data"].sample["images"]["low_resolution"]["url"]]
  end

end
