require 'spec_helper'

feature "the first trip", :js => true do
  scenario "creating an intended trip without having a user account" do
    puts "---------------------"
    visit "/"
    fill_in 'from', :with => "Inorbit Mall"
    sleep(1)
    find(".pac-item").click
    page.execute_script " $($(\"div.pac-item:contains('Inorbit Mall')\")[0]).trigger('mouseenter').click();"
    fill_in 'to', :with => "Phoenix Mills"
    sleep(1)
    find(".pac-item").click
    select 'weekdays', :from => "intended_trip_on"
    fill_in 'intended_trip_user_email', :with => 'svs@svs.io'
    fill_in 'intended_trip_user_password', :with => 's3kr3t'
    fill_in 'intended_trip_user_password_confirmation', :with => 's3kr3t'
    
    click_button('Register my Trip')
    page.should have_content("Thanks for registering")
  end

end
