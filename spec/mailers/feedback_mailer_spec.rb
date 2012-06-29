require "spec_helper"

describe FeedbackMailer do
  it "should send feedback correctly" do
    @email_address = "sender@abc.def"
    @body = "here's some feedback"
    @mail = FeedbackMailer.feedback(@email_address, @body).deliver
    ActionMailer::Base.deliveries.should_not be_empty
    @mail.to.should == ["svs@svs.io"]
    @mail.subject.should == "[rBus] Feedback from sender@abc.def"
    @mail.encoded.should match(@body)
    @mail.encoded.should match(@email_address)
  end
end
