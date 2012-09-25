require 'spec_helper'
include Warden::Test::Helpers
 
module RequestHelpers
  def create_logged_in_user
    user = FactoryGirl.create(:user)
    login(user)
    user
  end
 
  def login(user)
    login_as user, scope: :user
  end


  def login!(user)
    visit new_user_session_path
    fill_in 'user_email', :with => user
    fill_in 'user_password', :with => "s3cr3t"
    click_on 'Sign in'
  end
end

