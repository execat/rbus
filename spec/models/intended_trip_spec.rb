require 'spec_helper'
require 'debugger'
describe IntendedTrip do

  it {should have_property(:on) }
  it {should belong_to(:to_stop) }
  it {should belong_to(:from_stop) }

  it { should validate_presence_of(:on)}
  it {should belong_to(:user)}

  describe "nearby trips" do
    before :all do

      @t1f = FactoryGirl.create(:bus_stop)
      @t2f = FactoryGirl.create(:bus_stop, :lat => 0.008)
      @t3f = FactoryGirl.create(:bus_stop, :lat => 0.1) # far away

      @t1t = FactoryGirl.create(:bus_stop, :lat => 0.1)
      @t2t = FactoryGirl.create(:bus_stop, :lat => 0.008, :lng => 0.1)
      @t3t = FactoryGirl.create(:bus_stop, :lat => 0.108, :lng => 0.0)

      @t1 = FactoryGirl.create(:intended_trip, :from_stop => @t1f, :to_stop => @t1t)
      @t2 = FactoryGirl.create(:intended_trip, :from_stop => @t2f, :to_stop => @t2t)
      @t3 = FactoryGirl.create(:intended_trip, :from_stop => @t3f, :to_stop => @t3t)
    end

    it "should find correct nearby starting trips" do
      @t1.trips_within(1000).should == [@t2]
    end

    it "should find correct nearby ending trips" do
      @t1.trips_within(nil,1000).should == [@t3]
    end

    it "should sort trips properly" do
      @t1.nearest_trips.should == [
                                   {:trip => @t3, :start_distance => 11132.0031845342, :end_distance => 890.560254762731},
                                   {:trip => @t2, :start_distance => 890.560254762734, :end_distance => 15126.4176685615}
                                   ]
    end

  end

end
