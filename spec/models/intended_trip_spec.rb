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
      IntendedTrip.all.destroy!

      @t1 = FactoryGirl.create(:intended_trip, :to_lat => 0.1)
      @t2 = FactoryGirl.create(:intended_trip, :from_lat => 0.008, :to_lat => 0.008, :to_lng => 0.1)
      @t3 = FactoryGirl.create(:intended_trip, :from_lat => 0.1, :to_lat => 0.108, :to_lng => 0.0)
    end


    it "should sort trips properly" do
      @t1.nearest_trips.should == [
                                   {:trip => @t3, :start_distance => 11132.0031845342, :end_distance => 890.560254762731, :total_distance=>12022.563439296931},
                                   {:trip => @t2, :start_distance => 890.560254762734, :end_distance => 15126.4176685615, :total_distance=>16016.977923324233}
                                   ]
    end
    it "trips within" do
      @t1.trips_within(13000)[0].except(:from_lat, :from_lng, :to_lat, :to_lng).should == 
                                         { :id => @t3.id, :from_name => "from3", :to_name => "to3",
                                           :fdist => 11132.0031845342, :tdist => 890.560254762731
                                         }
                                        
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
