require "spec_helper"
require "cancan/matchers"

describe Ability do
  describe "as guest" do
    before(:each) do
      @ability = Ability.new(nil)
    end

    it "cannot access users" do
      @ability.should_not be_able_to(:access, :users)
    end
    it "cannot access trips" do
      @ability.should_not be_able_to(:access, :intended_trips)
    end
    it "can read trips" do
      @ability.should be_able_to(:read, :intended_trips)
    end
    it "cannot access bus_stops" do
      @ability.should_not be_able_to(:access, :bus_stops)
    end
  end

  describe "admin" do
    before(:all) do
      @admin = FactoryGirl.create(:admin_user)
      @ability = Ability.new(@admin)
    end
    
    it "can access users" do
      @ability.should be_able_to(:access, :users)
    end
    it "can access trips" do
      @ability.should be_able_to(:access, :intended_trips)
    end
    it "can access bus stops" do
      @ability.should be_able_to(:access, :bus_stops)
    end
  end

  describe "user" do
    before(:all) do
      @user = FactoryGirl.create(:user)
      @other_user = FactoryGirl.create(:user)
      @my_trip = FactoryGirl.create(:intended_trip, :user => @user)
      @other_trip = FactoryGirl.create(:intended_trip, :user => @other_user)
      @ability = Ability.new(@user)
    end
    
    describe "users" do
      it "can access itself" do
        @ability.should be_able_to(:access, @user)
      end
      it "cannot access other user" do
        @ability.should_not be_able_to :access, @other_user
      end
    end

    describe "trips" do
      it "can access own trips" do
        @ability.should be_able_to(:access, @my_trip)
      end
      it "cannot access other user's trips" do
        @ability.should_not be_able_to :access, @other_trip
      end
      it "can read other user's trips" do
        @ability.should be_able_to :read, @other_trip
      end        
    end

    it "cannot access bus stops" do
      @ability.should_not be_able_to(:access, :bus_stops)
    end
  end



end
