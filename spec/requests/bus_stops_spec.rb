require 'spec_helper'
require './spec/requests/request_helpers.rb'

include RequestHelpers

feature "adding a bus stop", :js => true do
  background do
    @user = FactoryGirl.create(:user)
    @user.confirm!
  end
  scenario "as logged in user" do
    visit new_user_session_path
    within "form" do
      fill_in "user_email", :with => @user.email
      fill_in "user_password", :with => "s3cr3t"
    end
    click_button "Sign in"
    visit new_bus_stop_path
    page.should have_selector('form#new_bus_stop')
    page.should have_selector('#bus_stop_name')
    page.should have_selector('#bus_stop_lat')
    page.should have_selector('#bus_stop_lng')
    fill_in 'bus_stop_name', :with => 'Evershine Nagar'
    sleep(3)
    page.execute_script " $(\".ui-menu-item a:contains('Evershine Nagar, K')\").trigger(\"mouseenter\").click();"
    click_button('Create Bus stop')
    page.should have_content('success')
  end

end
