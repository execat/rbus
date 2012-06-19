require 'spec_helper'

describe "intended_trips/new" do
  before(:each) do
    assign(:intended_trip, stub_model(IntendedTrip).as_new_record)
  end

  it "renders new intended_trip form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => intended_trips_path, :method => "post" do
    end
  end
end
