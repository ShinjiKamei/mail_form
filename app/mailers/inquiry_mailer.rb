class InquiryMailer < ActionMailer::Base
  helper InquiriesHelper

  default from: "noreply@example.com"

  def accepted_inquiry(inquiry)
    @inquiry = inquiry
    mail to: inquiry.email, subject: "お問合せを受付けました。"
  end


end
