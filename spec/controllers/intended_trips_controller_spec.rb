require 'debugger'
require 'spec_helper'

describe IntendedTripsController do
  before :each do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @bs1 = FactoryGirl.create(:bus_stop)
      @bs2 = FactoryGirl.create(:bus_stop)
      @u = FactoryGirl.create(:user)
      @u2 = FactoryGirl.create(:user)
  end

  context "new trip by brand new user" do
    describe "user with valid email" do
      before :each do
        @email = FactoryGirl.generate(:email)
        @valid_user_params = {:intended_trip => {:from_stop_id => @bs1.id, :to_stop_id => @bs2.id, :on => :weekdays, :user => {:email => @email}}}
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
    end

    describe "user with invalid email" do
      it "should not create new trip and account" do
        post :create, {:intended_trip => {:from_stop_id => @bs1.id, :to_stop_id => @bs2.id, :on => :weekdays, :user => {:email => "abc"}}}
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
  end

  context "new trip by logged in user" do
    before :each do
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
      


end
