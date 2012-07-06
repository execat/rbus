require 'spec_helper'

describe "intended_trips/index" do
  before(:each) do
    bs1 = stub_model(BusStop, :name => "bs1")
    bs2 = stub_model(BusStop, :name => "bs2")
    user = FactoryGirl.create(:user)
    view.stub(:current_user, user)
    assign(:intended_trips, [
      stub_model(IntendedTrip, :from_stop => bs1, :to_stop => bs2),
      stub_model(IntendedTrip, :from_stop => bs2, :to_stop => bs1)
    ])
    assign(:params, {:map => true})
  end

  it "renders a list of intended_trips" do
    render
    rendered.should have_selector('table')
  end

end
