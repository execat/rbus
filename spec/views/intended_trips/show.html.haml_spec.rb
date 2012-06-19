require 'spec_helper'

describe "intended_trips/show" do
  before(:each) do
    @intended_trip = assign(:intended_trip, stub_model(IntendedTrip))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
