class FeedbackMailer < ActionMailer::Base
  default to: "svs@svs.io"
  def feedback(email_address, feedback)
    @email_address = email_address
    @body = feedback
    mail(:subject => "[rBus] Feedback from #{email_address}", :from => "svs@rbus.in")
  end
end
