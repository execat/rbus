require 'spec_helper'

describe "intended_trips/show" do
  before(:each) do
    @t1 = Factory.create(:intended_trip)
    @t2 = Factory.create(:intended_trip)
    @t2.destroy
    @intended_trip = @t1
    @intended_trips = @t1.nearest_trips
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
