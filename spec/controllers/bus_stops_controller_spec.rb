require 'spec_helper'


describe BusStopsController do
  describe "index" do
    it "should return a list of bus stops" do
      get :index
      assigns(:bus_stops).should == BusStop.all
    end
  end
    
end
