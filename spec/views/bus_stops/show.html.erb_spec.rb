require 'spec_helper'

describe "bus_stops/show" do
  before(:each) do
    @bus_stop = assign(:bus_stop, stub_model(BusStop))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
