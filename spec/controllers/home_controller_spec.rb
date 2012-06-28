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

  context "logged in" do
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @u = FactoryGirl.create(:user)
      @u.confirm!
      sign_in @u
    end
    
    it "should redirect to my trips" do
      get :index
      response.should redirect_to("/intended_trips/my")
    end
  end


end
