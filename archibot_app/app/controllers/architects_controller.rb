class ArchitectsController < ApplicationController
  before_action :load_architect, only: [:show, :edit, :destroy]

  def index
    @architects = Architect.all
  end

  def show
    find_buildings(@architect)
  end

  def new
    @architect = Architect.new
  end

  def create
    @architect = Architect.new(user_params)
    @architect.save
    redirect_to architect_path(@architect.id)
  end

  def edit
  end

  def update
    @architect = Architect.find(params[:id])
    @architect.update (user_params)
    redirect_to architect_path
  end

  def destroy
    @architect.destroy
    redirect_to architects_path
  end



private 

  def load_architect
    @architect = Architect.find(params[:id])
  end

require 'addressable/uri'


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

  def user_params
    params.require(:architect).permit(:name, :style, :year_born, :year_died)
  end


end













