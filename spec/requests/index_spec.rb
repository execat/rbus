require 'spec_helper'

feature "the first trip" do
  background do
    @bus_stop1 = Factory.create(:bus_stop)
    @bus_stop2 = Factory.create(:bus_stop)
  end
  
  scenario "creating an intended trip without having a user account" do
    within "#new_trip" do
      fill_in 'from', :with => @bus_stop1.name
      fill_in 'to', :with => @bus_stop2.name
      select 'weekdays', :from => '#on'
    end
    click_button('Create My Trip')
  end

end
