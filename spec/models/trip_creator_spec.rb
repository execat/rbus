require 'spec_helper'

describe IntendedTripCreator do

  before :each do
    IntendedTrip.all.destroy!
    User.all.destroy!
    @bs1 = FactoryGirl.create(:bus_stop)
    @bs2 = FactoryGirl.create(:bus_stop)
  end

  context "brand new user" do
    before :each do
      tc = IntendedTripCreator.new(:from_stop => @bs1, :to_stop => @bs2, :on => "weekdays", :user => {:email => "abc@def.co.in"})
      tc.create
    end

    it "should create a user"  do
      User.all.count.should == 1
      User.last.email.should == "abc@def.co.in"
    end

    it "should create a trip"  do
      IntendedTrip.all.count.should == 1
      IntendedTrip.last.from_stop.should == @bs1
    end
  end

end
