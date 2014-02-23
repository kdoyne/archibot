class SplashController < ApplicationController
  include MethodHelper

  def index
    @photos = get_photos
  end
end
