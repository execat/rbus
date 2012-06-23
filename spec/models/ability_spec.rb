require "spec_helper"
require "cancan/matchers"

describe Ability do
  describe "as guest" do
    before(:each) do
      @ability = Ability.new(nil)
    end

    it "cannot manage users" do
      @ability.should_not be_able_to(:manage, :users)
    end
    it "cannot manage trips" do
      @ability.should_not be_able_to(:manage, :intended_trips)
    end
    it "can read trips" do
      @ability.should be_able_to(:read, :intended_trips)
    end
    it "cannot manage bus_stops" do
      @ability.should_not be_able_to(:manage, :bus_stops)
    end
  end

  describe "admin" do
    before(:all) do
      @admin = FactoryGirl.create(:admin_user)
      @ability = Ability.new(@admin)
    end
    
    it "can manage users" do
      @ability.should be_able_to(:manage, :users)
    end
    it "can manage trips" do
      @ability.should be_able_to(:manage, :intended_trips)
    end
    it "can manage bus stops" do
      @ability.should be_able_to(:manage, :bus_stops)
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
      it "can manage itself" do
        @ability.should be_able_to(:manage, @user)
      end
      it "cannot manage other user" do
        @ability.should_not be_able_to :manage, @other_user
      end
    end

    describe "trips" do
      it "can manage own trips" do
        @ability.should be_able_to(:manage, @my_trip)
      end
      it "cannot manage other user's trips" do
        @ability.should_not be_able_to :manage, @other_trip
      end
      it "can read other user's trips" do
        @ability.should be_able_to :read, @other_trip
      end        
    end

    it "cannot manage bus stops" do
      @ability.should_not be_able_to(:manage, :bus_stops)
    end
  end



end
