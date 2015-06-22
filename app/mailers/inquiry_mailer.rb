class InquiryMailer < ActionMailer::Base
  helper InquiriesHelper

  #default ruby-gmail.user: ""
  #default ruby-gmail.pass: ""

  default from: "noreply@example.com"

  def accepted_inquiry(inquiry)
    @inquiry = inquiry
    subject_str = "お問合せを受付けました。"
    mail to: inquiry.email, subject: subject_str
  end

  def response(response)
    @response = response
    @inquiry = Inquiry.find(response.inquiry_id)
    subject_str = "ご回答[inquiry_id=" + @inquiry.id.to_s + "]"
    mail to: @inquiry.email, subject: subject_str
  end

end
