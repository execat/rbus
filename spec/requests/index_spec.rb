require 'spec_helper'

feature "the first trip", :js => true do
  scenario "creating an intended trip without having a user account" do
    puts "---------------------"
    visit "/"
      selector = ".ui-menu-item a:contains(\"Inorbit Mall\")"
      fill_in 'intended_trip_from_name', :with => "Inorbit Mall"
      sleep(3)
      page.execute_script " $('#{selector}').trigger(\"mouseenter\").click();"
      page.find('intended_trip_from_lat').value.should == "foo"
      page.find('intended_trip_from_lng').value.should == "bar"
      fill_in 'intended_trip_to_name', :with => "Phoenix Mills"
      sleep(3)
      page.execute_script " $(\".ui-menu-item a:contains('Phoenix Mills')\").trigger(\"mouseenter\").click();"
      page.find('intended_trip_to_lat').value.should == "foo"
      page.find('intended_trip_to_lng').value.should == "bar"

      select 'weekdays', :from => "intended_trip_on"
      fill_in 'intended_trip_user_email', :with => 'svs@svs.io'
      fill_in 'intended_trip_user_password', :with => 's3kr3t'
      fill_in 'intended_trip_user_password_confirmation', :with => 's3kr3t'

    click_button('Register my Trip')
    page.should have_content("Thanks for registering")
  end

end
