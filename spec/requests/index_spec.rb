require 'spec_helper'

@selenium
feature "the first trip" do
  background do
    @bus_stop1 = FactoryGirl.create(:bus_stop)
    @bus_stop2 = FactoryGirl.create(:bus_stop)
  end

  @selenium
  scenario "creating an intended trip without having a user account" do
    visit "/"
    within "#new_intended_trip" do
      selector = ".ui-menu-item a:contains('#{@bus_stop1.name}')"
      fill_in 'from', :with => @bus_stop1.name
      sleep(3)
      page.execute_script " $('#{selector}').trigger(\"mouseenter\").click();"

      fill_in 'to', :with => @bus_stop2.name
      select 'weekdays', :from => "intended_trip_on"
      fill_in 'intended_trip_user_email', :with => 'svs@svs.io'
      fill_in 'intended_trip_user_password', :with => 's3kr3t'
      fill_in 'intended_trip_user_password_confirmation', :with => 's3kr3t'
    end
    click_button('Register my Trip')
    page.should have_content("success")
  end

end
