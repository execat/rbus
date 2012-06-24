require 'spec_helper'

feature "the first trip" do
  background do
    @bus_stop1 = FactoryGirl.create(:bus_stop)
    @bus_stop2 = FactoryGirl.create(:bus_stop)
  end

  scenario "creating an intended trip without having a user account" do
    visit "/"
    within "#new_intended_trip" do
      select @bus_stop1.name, :from => 'intended_trip_from_stop_id'
      select @bus_stop2.name, :from => 'intended_trip_to_stop_id'
      choose 'intended_trip_on_weekdays'
      fill_in 'intended_trip_user_email', :with => 'svs@svs.io'
    end
    click_button('Create Intended trip')
    page.should have_content("success")
  end

end
