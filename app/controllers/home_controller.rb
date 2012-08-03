class HomeController < ApplicationController

  def index
    if current_user
      redirect_to my_intended_trips_path
    else
      @intended_trip = IntendedTrip.new
    end
  end

  # posts feedback to svs@svs.io
  def feedback
    FeedbackMailer.feedback(params[:email], params[:body]).deliver
    redirect_to root_path, {success: "Thanks for the feedback. We'll be in touch shortly."}
  end

  def demo
    render
  end

end
