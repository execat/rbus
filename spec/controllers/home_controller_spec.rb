require 'spec_helper'

describe HomeController do

  context "not logged in" do
    it "should display index page with form for new trip" do
      get :index
      response.should be_ok
      response.should render_template(:index)
      assigns(:intended_trip).should be_a_new(IntendedTrip)
    end
  end

end
