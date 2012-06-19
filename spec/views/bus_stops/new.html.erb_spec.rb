require 'spec_helper'

describe "bus_stops/new" do
  before(:each) do
    assign(:bus_stop, stub_model(BusStop).as_new_record)
  end

  it "renders new bus_stop form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bus_stops_path, :method => "post" do
    end
  end
end
