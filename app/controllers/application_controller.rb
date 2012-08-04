require 'dm-rails/middleware/identity_map'
class ApplicationController < ActionController::Base
  use Rails::DataMapper::Middleware::IdentityMap
  protect_from_forgery
  enable_authorization :unless => :devise_controller?

  rescue_from CanCan::Unauthorized do |exception|
    if current_user
      redirect_to (request.referer || root_url), :alert => exception.message
    else
      redirect_to new_user_session_path, :alert => "Please log in in order to perform this action"
    end
  end

end
