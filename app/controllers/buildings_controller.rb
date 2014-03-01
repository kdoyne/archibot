class BuildingsController < ApplicationController
  include MethodHelper
  before_action :load_architect, only: [:index, :show, :edit, :create, :new, :destroy]
  before_action :load_building, only: [:show, :edit, :destroy, :update]

  def index
    @buildings = Building.where(architect_id: params[:architect_id])
  end

  def show
    find_entries(@building)
    @map = get_map(@building,@buildings_nearby)
    pull_photos(@building)
    if @building.description != nil
      @description = @building.description
    else
      @description = get_building_description(@building)
      @building.description = @description
    end
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(user_params)
    @building.architect = @architect
    @building_description = get_building_description(@building)
    if @building.description == nil
      @building.description = @building_description
      @building.save
    else
      @building.save
    end
    if @building.save
      redirect_to architect_building_path(@architect, @building)
    else
      render(:new)
    end
  end

  def edit
  end

  def update
    @building.update(user_params)
    redirect_to architect_building_path
  end

  def destroy
    if current_user.is_admin?
      @building.destroy
      redirect_to architect
    else
      render nothing: true, status: 401
    end
  end

  def favorite
    @building = Building.find(params[:id])
    current_user.buildings << @building
    redirect_to architect_building_path
  end

  def unfavorite
    @building = Building.find(params[:id])
    current_user.buildings.delete(@building)
    redirect_to architect_building_path
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
end




