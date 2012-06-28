class HomeController < ApplicationController

  def index
    if current_user
      redirect_to my_intended_trips_path
    else
      @intended_trip = IntendedTrip.new
    end
  end
end
