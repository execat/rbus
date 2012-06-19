require 'spec_helper'

describe "intended_trips/index" do
  before(:each) do
    assign(:intended_trips, [
      stub_model(IntendedTrip),
      stub_model(IntendedTrip)
    ])
  end

  it "renders a list of intended_trips" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
