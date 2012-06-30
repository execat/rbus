require 'spec_helper'


describe BusStopsController do
  describe "index" do
    it "should return a list of bus stops" do
      get :index
      assigns(:bus_stops).should == BusStop.all
    end

    it "should filter by search term" do
      @bs1 = FactoryGirl.create(:bus_stop, :name => "FoObar")
      @bs2 = FactoryGirl.create(:bus_stop, :name => "bazblat")
      @bs3 = FactoryGirl.create(:bus_stop, :name => "kungfoo")
      get :index, {:term => "foo"}
      assigns(:bus_stops).should == [@bs1, @bs3]
    end
      
  end
    
end
