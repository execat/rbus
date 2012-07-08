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

  describe "new" do
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @u = FactoryGirl.create(:user)
      @u.confirm!
    end

    describe "not logged in" do
      it "should raise CanCan::Unauthorized" do
        expect { get :new }.to raise_error CanCan::Unauthorized
      end
    end

    describe "logged in" do
      before :each do
        sign_in @u
        get :new
      end

      it "should render new template" do
        response.should render_template(:new)
      end
    end

  end
      
    
end
