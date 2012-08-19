require 'spec_helper.rb'
RSpec.configure do |config|
  config.include Devise::TestHelpers
end

describe "home/index" do
  
  context "not logged in" do
    before(:each) do
      @intended_trip = assign(:intended_trip, stub_model(IntendedTrip))
    end
    
    it "renders the edit intended_trip form" do
      render
      
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "form", :action => intended_trips_path(@intended_trip), :method => "post" do
        assert_select "#intended_trip_from_name"
        assert_select "#intended_trip_to_name"
        assert_select "#intended_trip_on"
        assert_select "#intended_trip_user_email"
      end
    end
  end

end
