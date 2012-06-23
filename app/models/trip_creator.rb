class IntendedTripCreator

  # Given some params, this class creates an IntendedTrip and handles all the complications surrounding brand new users

  # Public (naturally)
  # given a datamapper hash of attributes, this massages the attributes to make valid objects if it can
  # specifically, when presented with an email address that does not exist, it adds password and password confirmation to the user part of the attributes
  # so as to dynamically create a new user
  def initialize(params)
    if params[:user].is_a? Hash                                            # we have something like :user => {:email => foo@bar.com}
      @user = User.first(:email => params[:user][:email]) if params[:user] # and this email address does not exist in our database
      unless @user
        generated_password = Devise.friendly_token.first(6)                # populate the params with data for the new user
        params[:user].merge!(:password =>  generated_password, :password_confirmation => generated_password)
      end
    end
    @params = params
  end

  # Public: The intended trip implied by the params
  def intended_trip
    @it ||= IntendedTrip.new(@params)
  end

  # Public: Actually creates the intended trip and the user if required.
  # returns the trip created
  def create
    intended_trip ? (intended_trip.save ? intended_trip : nil) : nil
  end
      

end
