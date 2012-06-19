require "spec_helper"

describe IntendedTripsController do
  describe "routing" do

    it "routes to #index" do
      get("/intended_trips").should route_to("intended_trips#index")
    end

    it "routes to #new" do
      get("/intended_trips/new").should route_to("intended_trips#new")
    end

    it "routes to #show" do
      get("/intended_trips/1").should route_to("intended_trips#show", :id => "1")
    end

    it "routes to #edit" do
      get("/intended_trips/1/edit").should route_to("intended_trips#edit", :id => "1")
    end

    it "routes to #create" do
      post("/intended_trips").should route_to("intended_trips#create")
    end

    it "routes to #update" do
      put("/intended_trips/1").should route_to("intended_trips#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/intended_trips/1").should route_to("intended_trips#destroy", :id => "1")
    end

  end
end
