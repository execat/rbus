require 'spec_helper'

describe IntendedTripCreator do

  before :each do
    IntendedTrip.all.destroy!
    User.all.destroy!
    @bs1 = FactoryGirl.create(:bus_stop)
    @bs2 = FactoryGirl.create(:bus_stop)
  end

  context "brand new user" do
    before :all do
    end

    describe "valid trip" do
      before :each do
        IntendedTrip.all.destroy!
        User.all.destroy!
        @valid_trip = {:from_stop => @bs1, :to_stop => @bs2, :on => "weekdays", :user => {:email => "abc@def.co.in", :password => "abcdef", :password_confirmation => "abcdef"}}
        @t = IntendedTripCreator.new(@valid_trip)
      end

      it "should give correct answers for valid?" do
        @t.should be_valid
      end
      
      it "should save a user"  do
        @t.save
        User.all.count.should == 1
        User.last.email.should == "abc@def.co.in"
      end

      it "should save a trip"  do
        @t.save
        IntendedTrip.all.count.should == 1
        IntendedTrip.last.from_stop.should == @bs1
      end
    end

    describe "valid trip invalid user" do
      before :each do
        IntendedTrip.all.destroy!
        User.all.destroy!
        @invalid_user_trip = {:from_stop => @bs1, :to_stop => @bs2, :on => "weekdays", :user => {:email => "abc@def.co.in"}}
        @t = IntendedTripCreator.new(@invalid_user_trip)
      end

      it "should give correct answers for valid?" do
        @t.should_not be_valid
        @t.user.should_not be_valid
      end
      
      it "should save a user"  do
        @t.save
        User.all.count.should == 0
      end

      it "should save a trip"  do
        @t.save
        IntendedTrip.all.count.should == 0
      end
    end

    describe "invalid trip valid user" do
      before :each do
        IntendedTrip.all.destroy!
        User.all.destroy!
        @invalid_trip = {:from_stop => nil, :to_stop => @bs2, :on => "weekdays", :user => {:email => "abc@def.co.in", :password => "abcdef", :password_confirmation => "abcdef"}}
        @t = IntendedTripCreator.new(@invalid_trip)
      end

      it "should give correct answers for valid?" do
        @t.user.should be_valid
        @t.trip.should_not be_valid
      end
      
      it "should save a user"  do
        @t.save
        User.all.count.should == 0
      end

      it "should save a trip"  do
        @t.save
        IntendedTrip.all.count.should == 0
      end
    end


  end

end
