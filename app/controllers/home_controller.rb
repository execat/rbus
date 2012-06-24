class HomeController < ApplicationController

  def index
    @intended_trip = IntendedTrip.new
  end
end
