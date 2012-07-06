class IntendedTripsController < ApplicationController
  # GET /intended_trips
  # GET /intended_trips.json
  
  load_and_authorize_resource
  
  def index
    @intended_trips = IntendedTrip.all
    respond_to do |format|
      format.html {
        if params[:map]
          render :map
        else
          render
        end
      }
      format.json { }
    end
  end

  def my
    unless current_user
      redirect_to new_user_session_path  and return
    end
    @intended_trips = IntendedTrip.all(:user => current_user)
    respond_to do |format|
      format.html { render 'index'}
      format.json { render json: @intended_trips }
    end
  end

  # GET /intended_trips/1
  # GET /intended_trips/1.json
  def show
    @intended_trip = IntendedTrip.get(params[:id])
    @intended_trips = @intended_trip.nearest_trips
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @intended_trip }
    end
  end

  # GET /intended_trips/new
  # GET /intended_trips/new.json
  def new
    @intended_trip = IntendedTrip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @intended_trip }
    end
  end

  # GET /intended_trips/1/edit
  def edit
    @intended_trip = IntendedTrip.get(params[:id])
    raise unless @intended_trip.user == current_user
  end

  # POST /intended_trips
  # POST /intended_trips.json
  def create
    if !current_user
      @user = User.first(:email => params[:intended_trip][:user][:email]) if params[:intended_trip][:user] # and this email address does not exist in our database
      if @user
        redirect_to new_user_session_path, {alert: "Please give us your password"} and return
      end
      @new_user = true
    else
      params[:intended_trip][:user_id] ||= current_user.id
    end
    @intended_trip_creator = IntendedTripCreator.new(params[:intended_trip])
    @intended_trip = @intended_trip_creator.trip
    if (current_ability.can?(:manage, @intended_trip_creator.trip)) || !current_user
      respond_to do |format|
        if @intended_trip_creator.save
          msg =  'Thanks for registering your commute'
          msg += "We've just sent you and email. Kindly confirm your email address by clicking on the confirm link in it." if @new_user
          format.html { redirect_to @intended_trip_creator.trip, notice: msg }
          format.json { render json: @intended_trip_creator.trip, status: :created, location: @intended_trip }
        else
          if !(@intended_trip_creator.trip.errors.keys && [:from_stop_id, :to_stop_id]).empty?
            @map = true
          end
          format.html { render action: "new" }
          format.json { render json: @intended_trip.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to intended_trips_path, error: "You do not have sufficient privileges to do this"
    end
  end

  # PUT /intended_trips/1
  # PUT /intended_trips/1.json
  def update
    @intended_trip = IntendedTrip.get(params[:id])

    respond_to do |format|
      if @intended_trip.update(params[:intended_trip])
        format.html { redirect_to @intended_trip, notice: 'Intended trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @intended_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intended_trips/1
  # DELETE /intended_trips/1.json
  def destroy
    @intended_trip = IntendedTrip.get(params[:id])
    raise unless @intended_trip.user == current_user
    @intended_trip.destroy

    respond_to do |format|
      format.html { redirect_to intended_trips_url }
      format.json { head :no_content }
    end
  end
end
