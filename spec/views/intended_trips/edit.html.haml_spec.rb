require 'spec_helper'

describe "intended_trips/edit" do
  before(:each) do
    user = FactoryGirl.create(:user)
    view.stub(:current_user, user)

    @intended_trip = assign(:intended_trip, stub_model(IntendedTrip))
  end

  it "renders the edit intended_trip form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => intended_trips_path(@intended_trip), :method => "post" do
    end
  end
end
