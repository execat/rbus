require 'debugger'
require 'spec_helper'

describe IntendedTripsController do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    @bs1 = FactoryGirl.create(:bus_stop)
    @bs2 = FactoryGirl.create(:bus_stop)
    @u = FactoryGirl.create(:user)
    @u2 = FactoryGirl.create(:user)
    @u.confirm!
  end

  context "new trip by brand new user" do
    describe "user with valid email" do
      before :each do
        @email = FactoryGirl.generate(:email)
        @valid_user_params = {:intended_trip => {:from_stop_id => @bs1.id, :to_stop_id => @bs2.id, :on => :weekdays, :user => {:email => @email, :password => "abcdef", :password_confirmation => "abcdef"}}}
      end
      it "should assign @trip properly" do
        post :create, @valid_user_params
        assigns[:intended_trip].should  be_instance_of(IntendedTrip).with(:from_stop_id => @bs1.id, :to_stop_id => @bs2.id, :on => "weekdays")
        response.should redirect_to assigns(:intended_trip)
      end
      it "should add a new trip" do
        expect {         
          post :create, @valid_user_params
        }.to change(IntendedTrip, :count).by(1)
      end
      it "should send confirmation email" do
        expect {         
          post :create, @valid_user_params
        }.to change(ActionMailer::Base.deliveries, :count).by(1)
      end
    end

    describe "user with invalid email" do
      it "should not create new trip and account" do
        post :create, {:intended_trip => {:from_stop_id => @bs1.id, :to_stop_id => @bs2.id, :on => :weekdays, :user => {:email => "abc", :password => "abcdef", :password_confirmation => "abcdef"}}}
        assigns(:intended_trip).user.errors.keys.should == [:email]
        response.should render_template(:new)
      end
    end      
  end

  context "new trip by unloggedin user with existing email" do
    it "should not create new trip" do
      expect {
        post :create, {:intended_trip => {:from_stop_id => @bs1.id, :to_stop_id => @bs2.id, :on => :weekdays, :user => {:email => @u.email}}}
      }.to change(IntendedTrip, :count).by(0)
    end

    it "should redirect to sign in page" do
      post :create, {:intended_trip => {:from_stop_id => @bs1.id, :to_stop_id => @bs2.id, :on => :weekdays, :user => {:email => @u.email}}}
      response.should redirect_to new_user_session_path
    end


  end

  context "new trip by logged in user" do
    before :each do
      @u.confirm!
      sign_in @u
    end

    it "should create new trip" do
      expect {
        post :create, {:intended_trip => {:from_stop_id => @bs1.id, :to_stop_id => @bs2.id, :on => :weekdays, :user_id => @u.id}}
      }.to change(IntendedTrip, :count).by(1)
    end
    
    it "should not create a trip if user id is for other user" do
      expect {
        post :create, {:intended_trip => {:from_stop_id => @bs1.id, :to_stop_id => @bs2.id, :on => :weekdays, :user_id => @u2.id}}
      }.to change(IntendedTrip, :count).by(0)
    end
  end

  context "trips index" do
    before :each do
      IntendedTrip.all.destroy!
      @my_trip = FactoryGirl.create(:intended_trip, :user => @u)
      @other_trip = FactoryGirl.create(:intended_trip, :user => @u2)
      sign_in @u
    end

    it "should show all trips" do
      get :index
      assigns(:intended_trips).should == [@my_trip, @other_trip]
    end

    it "should show only my trips if requested" do
      get :my
      assigns(:intended_trips).should == [@my_trip]
    end
  end

  context "trip show" do
    before :each do
      IntendedTrip.all.destroy!
      @my_trip = FactoryGirl.create(:intended_trip, :user => @u)
      @other_trip = FactoryGirl.create(:intended_trip, :user => @u2)
      sign_in @u
    end

    it "should show nearest trips" do
      get :show, {:id => @my_trip.id}
      assigns(:intended_trips).should == [@other_trip]
    end
  end

      


end
