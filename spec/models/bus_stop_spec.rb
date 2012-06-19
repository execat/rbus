require 'spec_helper'

describe BusStop do
  it { should have_property(:lat) }
  it { should have_property(:lng) }
  it { should have_property(:name) }
  
  it { should validate_presence_of(:lat) }
  it { should validate_presence_of(:lng) }
  it { should validate_presence_of(:name) }


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
      
end
