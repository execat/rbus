require 'spec_helper'

describe "bus_stops/index" do
  before(:each) do
    assign(:bus_stops, [
      stub_model(BusStop),
      stub_model(BusStop)
    ])
  end

  it "renders a list of bus_stops" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
