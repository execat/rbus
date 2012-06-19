require "spec_helper"

describe BusStopsController do
  describe "routing" do

    it "routes to #index" do
      get("/bus_stops").should route_to("bus_stops#index")
    end

    it "routes to #new" do
      get("/bus_stops/new").should route_to("bus_stops#new")
    end

    it "routes to #show" do
      get("/bus_stops/1").should route_to("bus_stops#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bus_stops/1/edit").should route_to("bus_stops#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bus_stops").should route_to("bus_stops#create")
    end

    it "routes to #update" do
      put("/bus_stops/1").should route_to("bus_stops#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bus_stops/1").should route_to("bus_stops#destroy", :id => "1")
    end

  end
end
