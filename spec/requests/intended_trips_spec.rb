require 'spec_helper'
require './spec/requests/request_helpers.rb'

include RequestHelpers

feature "edit trips" do
  before :all do
    @user = FactoryGirl.create(:user)
    @user.confirm!
  end

  scenario "as user", :js => true do
    login!(@user.email)
    visit new_intended_trip_path
    fill_in 'from', :with => "Inorbit Mall"
    sleep(1)
    find(".pac-item").click
    fill_in 'to', :with => "Phoenix Mills"
    sleep(1)
    find(".pac-item").click
    click_on 'Register my Trip'
    click_on 'Edit'
    page.should have_content 'Inorbit Mall'
    page.find('#intended_trip_to_lat').value.should == "18.994359"
    fill_in 'from', :with => "Malabar Hill"
    sleep(1)
    find(".pac-item").click
    click_on 'Register my Trip'
    page.should have_content 'Your trip has been updated'
    page.should have_content "Malabar Hill"
  end
end
