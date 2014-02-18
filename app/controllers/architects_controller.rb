  class ArchitectsController < ApplicationController
  before_action :load_architect, only: [:show, :edit, :destroy, :favorite, :unfavorite, :update]

  def index
    @items = Architect.search(params[:search])
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
    if @architect.save
      redirect_to architect_path(@architect)
    else
      render(:new)
    end
  end

  def edit
  end

  def update
    @architect.update (user_params)
    redirect_to architect_path
  end

  def destroy
    if current_user.is_admin?
      @architect.destroy
      redirect_to architects_path
    else
      render nothing: true, status: 401
    end
  end

  def favorite
    current_user.architects << @architect
    redirect_to architect_path
  end

  def unfavorite
    current_user.architects.delete(@architect)
    redirect_to architect_path
  end

  def search
    @items = Architect.search(params[:search])
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













