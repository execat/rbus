require 'spec_helper'

describe "bus_stops/edit" do
  before(:each) do
    @bus_stop = assign(:bus_stop, stub_model(BusStop))
  end

  it "renders the edit bus_stop form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bus_stops_path(@bus_stop), :method => "post" do
    end
  end
end
