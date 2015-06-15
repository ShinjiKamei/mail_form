require "spec_helper"

describe InquiryMailer do
  before do
    @subject = "お問合せを受付けました。"
    #@site_title = "MyHomepage"
    @category = FactoryGirl.create(:category)
  end
 
  after(:all) do
    ActionMailer::Base.deliveries.clear
  end
 
 
 
  describe "accepted inquiry" do
 
    describe "when creating mail and before sending it" do
      let(:inquiry) { FactoryGirl.create(:inquiry) }
      let(:mail) { InquiryMailer.accepted_inquiry(inquiry) }
      # use Base64.decode64 because somehow mail.body is empty
      
      it "renders the headers" do
        expect(mail.subject).to eq @subject
        expect(mail.to.first).to eq inquiry.email
      end

      describe "after sending the mail" do
        before do
          mail.deliver
        end
 
        let(:sent_mail) { ActionMailer::Base.deliveries.last }
 
        specify { expect(ActionMailer::Base.deliveries.count).to eq 1 }
 
        it "renders the headers" do
          expect(sent_mail.subject).to eq @subject
          expect(sent_mail.to.first).to eq inquiry.email
        end
 
      end
    end
  end

end
