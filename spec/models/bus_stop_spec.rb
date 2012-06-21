require 'spec_helper'

describe BusStop do
  it { should have_property(:lat) }
  it { should have_property(:lng) }
  it { should have_property(:name) }
  
  it { should validate_presence_of(:lat) }
  it { should validate_presence_of(:lng) }
  it { should validate_presence_of(:name) }

  it { should have_many(:intended_trips) }

  describe "latitude and lng" do
    before :all do
      @stop = FactoryGirl.create(:bus_stop)
    end

    it "should have lng > -180" do
      @stop.lng = -181
      @stop.should_not be_valid
    end

    it "should have lng < 180" do
      @stop.lng = 181
      @stop.should_not be_valid
    end

    it "should have lat less than 90" do
      @stop.lat = 91
      @stop.should_not be_valid
    end

    it "should have lat greater than -90" do
      @stop.lat = -91
      @stop.should_not be_valid
    end
  end

  describe "nearby bus stops" do
    before :all do
      BusStop.all.destroy!
      @s1 = FactoryGirl.create(:bus_stop, :lat => 0.0, :lng => 0.0)
      @s2 = FactoryGirl.create(:bus_stop, :lat => 0.008, :lng => 0.0) # distance < 1km
      @s3 = FactoryGirl.create(:bus_stop, :lat => 0.01, :lng => 0.0)  # distance > 1km
    end

    it "should find nearby bustops properly" do
      @s1.within(1000).should == [@s2]
    end

    it "should find all bus stops near a point properly" do
      BusStop.within(1000,0,0).should == [@s1, @s2]
    end

  end
end
