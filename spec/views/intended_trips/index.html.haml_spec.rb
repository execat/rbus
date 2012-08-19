require 'spec_helper'

describe "intended_trips/index" do
  before(:each) do
    user = FactoryGirl.create(:user)
    view.stub(:current_user, user)
    assign(:intended_trips, [
      stub_model(IntendedTrip),
      stub_model(IntendedTrip)
    ])
    assign(:params, {:map => true})
  end

  it "renders a list of intended_trips" do
    render
    rendered.should have_selector('table')
  end

end
