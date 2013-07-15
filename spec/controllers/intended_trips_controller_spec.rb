require 'spec_helper'

describe IntendedTripsController do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @u = FactoryGirl.create(:user)
    @u2 = FactoryGirl.create(:user)
    @u.confirm!
  end

  context "new trip by brand new user" do
    describe "user with valid email" do
      before :each do
        @email = FactoryGirl.generate(:email)
        @valid_user_params = {
          :intended_trip => {
            :from_name => "from", :from_lat => 0, :from_lng => 0,
            :to_name => "to", :to_lat => 0, :to_lng => 0,
            :on => "weekdays",
            :user => {:email => @email, :password => "abcdef", :password_confirmation => "abcdef"}
          }
        }
      end
      it "should assign @trip properly" do
        post :create, @valid_user_params
        assigns[:intended_trip_creator].trip.should  be_instance_of(IntendedTrip)
        {:from_name => "from", :to_name => "to", :on => "weekdays"}.each do |attr, value|
          assigns[:intended_trip_creator].trip.send(attr).should == value
        end
        assigns(:map).should be_nil
        response.should redirect_to assigns(:intended_trip_creator).trip
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
        post :create, {
          :intended_trip => {
            :from_name => "from", :from_lat => 0, :from_lng => 0,
            :to_name => "to", :to_lat => 0, :to_lng => 0,
            :on => "weekdays",
            :user => {:email => "abc", :password => "abcdef", :password_confirmation => "abcdef"}
          }
        }
        assigns(:intended_trip_creator).errors.keys.should include(:email)
        response.should render_template(:new)
      end
    end

    describe "with invalid bus_stops" do
      before :each do
        @u = FactoryGirl.build(:user)
        @invalid_bus_stop_params = {
          :intended_trip => {
            :from_name => "from", :from_lat => 0,
            :to_name => "to", :to_lat => 0, :to_lng => 0,
            :on => "weekdays",
            :user => {:email => @u.email, :password => "abcdef", :password_confirmation => "abcdef"}
          }
        }
      end

      it "should show the map" do
        post :create, @invalid_bus_stop_params
        response.should render_template(:new)
      end

      it "should not save the user" do
        expect { post :create, @invalid_bus_stop_params}.to change(User, :count).by(0)
      end
    end

  end

  context "new trip by unloggedin user with existing email" do
    before :each do
      @existing_email_params = {
        :intended_trip => {
          :from_name => "from", :from_lat => 0, :from_lng => 0,
          :to_name => "to", :to_lat => 0, :to_lng => 0,
          :on => "weekdays",
          :user => {:email => @u.email}
        }
      }
    end

    it "should not create new trip" do
      expect {
        post :create, @existing_email_params
      }.to change(IntendedTrip, :count).by(0)
    end

    it "should redirect to sign in page" do
      post :create, @existing_email_params
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
        post :create, {
          :intended_trip => {
            :from_name => "from", :from_lat => 0, :from_lng => 0,
            :to_name => "to", :to_lat => 0, :to_lng => 0,
            :on => "weekdays",
          }
        }
      }.to change(IntendedTrip, :count).by(1)
    end

    it "should not create a trip if user id is for other user" do
      post :create, {
        :intended_trip => {
          :from_name => "from", :from_lat => 0, :from_lng => 0,
          :to_name => "to", :to_lat => 0, :to_lng => 0,
          :on => "weekdays",
          :user_id => @u2.id
        }
      }
      response.should redirect_to "/"
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
      response.should render_template(:index)
      response.should be_ok
    end

    it "should show map when requested" do
      get :index, {:map => true}
      response.should render_template(:map)
    end

    it "should show only my trips if requested" do
      get :my
      assigns(:intended_trips).should == [@my_trip]
      response.should be_ok
    end

    describe "filter" do
      before :each do
        IntendedTrip.all.destroy!
        @t1 = create_trip_by_latlng(0,0,1,1)
        @t2 = create_trip_by_latlng(0,0,0.5,0.5)
        @t3 = create_trip_by_latlng(1,1,1,1)
        @t4 = create_trip_by_latlng(1,1,2,2)
      end

      it "should filter properly" do
        get :index, :from => {:lat1 => 0, :lng1 => 0, :lat2 => 0.1, :lng2 => 0.1}, :to => {:lat1 => 0, :lng1 => 0, :lat2 => 1, :lng2 => 1}
        assigns(:intended_trips).should == [@t1, @t2]
        response.should render_template(:filter)
      end

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
      assigns(:intended_trips).should == assigns(:intended_trip).trips_within(2000).map(&:stringify_keys)
      response.should be_ok
    end

    context "deleted trips in the db" do
      before :each do
        @deleted_trip = FactoryGirl.create(:intended_trip)
        @deleted_trip.destroy
      end

      it "should render template ok" do
        get :show, {:id => @my_trip.id}
        response.should render_template(:show)
      end
    end
  end

  context "trip edit" do
    before :each do
      IntendedTrip.all.destroy!
      @my_trip = FactoryGirl.create(:intended_trip, :user => @u)
      @other_trip = FactoryGirl.create(:intended_trip, :user => @u2)
      sign_in @u
    end

    describe "own trip" do
      it "should assign data correctly" do
        get :edit, {:id => @my_trip.id}
        response.should render_template(:edit)
      end

      it "should assign data correctly" do
        get :edit, {:id => @my_trip.id}
        assigns(:intended_trip).should == @my_trip
      end
    end

    describe "other's trip" do
      it "should redirect to referer or root url" do
        get :edit, {:id => @other_trip.id}
        response.should redirect_to "/"
      end
    end

  end

  context "trip update" do
    before :each do
      IntendedTrip.all.destroy!
      @my_trip = FactoryGirl.create(:intended_trip, :user => @u)
      @other_trip = FactoryGirl.create(:intended_trip, :user => @u2)
      sign_in @u
    end

    describe "own trip" do
      it "should assign data correctly" do
        IntendedTrip.any_instance.should_receive(:save)
        post :update, {:id => @my_trip.id, :intended_trip => {:from_lat => 55}}
      end

      it "should assign data correctly" do
        post :update, {:id => @my_trip.id, :intended_trip => {}}
        assigns(:intended_trip).should == @my_trip
      end
    end

    describe "other's trip" do
      it "should raise error for unauthorised" do
        post :update, {:id => @other_trip.id}
        response.should redirect_to "/"
        flash[:alert].should =~ /author/
      end
    end

  end



end
