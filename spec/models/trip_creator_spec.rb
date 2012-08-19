require 'spec_helper'

describe IntendedTripCreator do
  before :all do
    @admin = FactoryGirl.create(:user)
  end

  context "brand new user" do
    describe "valid trip" do
      before :each do
        email = FactoryGirl.generate(:email)
        @valid_trip = {
          :from_name => "from", :from_lat => 0, :from_lng => 0,
          :to_name => "to", :to_lat => 0, :to_lng => 0,
          :on => "weekdays", 
          :user => {
            :email => email, :password => "abcdef", :password_confirmation => "abcdef"
          }
        }
        @t = IntendedTripCreator.new(@valid_trip)
      end

      it "should give correct answers for valid?" do
        @t.should be_valid
      end
      
      it "should save a user"  do
        expect {@t.save}.to change(User, :count).by(1)
      end

      it "should save a trip"  do
        puts "-----------------------"
        expect {@t.save}.to change(IntendedTrip, :count).by(1)
      end
    end

    describe "valid trip invalid user" do
      before :each do
        @invalid_user_trip = {          
          :from_name => "from", :from_lat => 0, :from_lng => 0,
          :to_name => "to", :to_lat => 0, :to_lng => 0,
          :on => "weekdays", 
          :user => {:email => "abc@def.co.in"}}
        @t = IntendedTripCreator.new(@invalid_user_trip)
      end

      it "should give correct answers for valid?" do
        @t.should_not be_valid
        @t.user.should_not be_valid
      end
      
      it "should not save a user"  do
        expect {@t.save}.to change(User,:count).by(0)
      end

      it "should not save a trip"  do
        expect {@t.save}.to change(IntendedTrip,:count).by(0)
      end
    end

    describe "invalid trip valid user" do
      before :each do
        @invalid_trip = {
          :from_name => "from", :from_lat => 0,
          :to_name => "to", :to_lat => 0, :to_lng => 0,
          :on => "weekdays", 
          :user => {
            :email => "abcd@def.co.in", :password => "abcdef", :password_confirmation => "abcdef"
          }
        }
        @t = IntendedTripCreator.new(@invalid_trip)
      end

      it "should give correct answers for valid?" do
        @t.user.should be_valid
        @t.trip.should_not be_valid
      end
      
      it "should not save a user"  do
        expect {@t.save}.to change(User,:count).by(0)
      end

      it "should not save a trip"  do
        expect {@t.save}.to change(IntendedTrip,:count).by(0)
      end
    end


  end

end
