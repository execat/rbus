class IntendedTripCreator

  # Given some params, this class creates an IntendedTrip and handles all the complications surrounding brand new users
  def initialize(params)
    @params = params
  end


  # Public: Actually creates the intended trip and the user if required.
  # returns the trip created
  def save
    valid? ? (trip.save ? trip : nil) : nil
  end
     
  # Private: The intended trip implied by the params
  def trip
    @it ||= IntendedTrip.new(@params)
  end

  def user
    trip.user
  end

  def errors
    trip_errors && user_errors
  end

  # Private: checks if both the trip and the user (if new) are valid
  def valid?
    user_valid? and trip_valid?
  end



  private
  #Private: returns the errors dictionary on the trip
  def trip_errors
    trip.valid?
    trip.errors
  end

  def user_errors
    user.valid?
    user.errors
  end

  def user_valid?
    user.valid?
  end

  def trip_valid?
    # ignore errors related to the user. when trip has not been saved, the user_id validation fails even if the rest of the trip is valid
    (trip_errors.keys - [:user_id]).blank?
  end


end
