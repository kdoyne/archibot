class TripsController < ApplicationController

def new
  @trip = Trip.new
end 

def create
  @user = current_user
  @trip = Trip.new
  @trip.user_id = @user.id
  @trip.title = params[:trip][:title]
  @trip.location = params[:trip][:location]
  @trip.save
  @trip.buildings << Building.where(id: params[:trip][:buildings])
  redirect_to user_path(@user)
end

def show
  @trip = Trip.find(params[:id])
end

end

