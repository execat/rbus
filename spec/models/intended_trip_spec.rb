require 'spec_helper'
require 'debugger'
describe IntendedTrip do

  it {should have_property(:on) }
  [:from_name, :from_lat, :from_lng, :to_name, :to_lat, :to_lng].each do |p|
    it {should have_property(p)}
  end

  it { should validate_presence_of(:on)}
  it { should validate_inclusion_of(:on).within(["weekdays", "weekdays and saturday", "all days"])}
  it {should belong_to(:user)}

  describe "nearby trips" do
    before :all do

      @t1f = FactoryGirl.create(:bus_stop)
      @t2f = FactoryGirl.create(:bus_stop, :lat => 0.008)
      @t3f = FactoryGirl.create(:bus_stop, :lat => 0.1) # far away

      @t1t = FactoryGirl.create(:bus_stop, :lat => 0.1)
      @t2t = FactoryGirl.create(:bus_stop, :lat => 0.008, :lng => 0.1)
      @t3t = FactoryGirl.create(:bus_stop, :lat => 0.108, :lng => 0.0)

      @t1 = FactoryGirl.create(:intended_trip, :to_lat => 0.1)
      @t2 = FactoryGirl.create(:intended_trip, :from_lat => 0.008, :to_lat => 0.008, :to_lng => 0.1)
      @t3 = FactoryGirl.create(:intended_trip, :from_lat => 0.1, :to_lat => 0.108, :to_lng => 0.0)
    end


    it "should sort trips properly" do
      @t1.nearest_trips.should == [
                                   {:trip => @t3, :start_distance => 11132.0031845342, :end_distance => 890.560254762731},
                                   {:trip => @t2, :start_distance => 890.560254762734, :end_distance => 15126.4176685615}
                                   ]
    end


    describe "#filter" do
      before :all do
        @from_coordinates = {:lng1 => 0, :lat1 => 0, :lng2 => 0.01, :lat2 => 0.01}
        @to_coordinates = {:lng1 => 0.0, :lat1 => 0.008, :lng2 => 0.1, :lat2 => 0.108}
      end

      it "should return all with no trips" do
        IntendedTrip.filter.should == IntendedTrip.all
      end

      it "should filter from correctly" do
        IntendedTrip.filter(:from => @from_coordinates).should == [@t1, @t2]
      end

      it "should filter to correctly" do
        IntendedTrip.filter(:to => @to_coordinates).should == [@t1,@t2, @t3]
      end
      
      it "should filter both correctly" do
        IntendedTrip.filter(:from => @from_coordinates, :to => @to_coordinates).should == [@t1, @t2]
      end
    end

  end

end
