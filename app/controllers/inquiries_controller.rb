require 'gmail'

class InquiriesController < ApplicationController
  
  
  def new
    @inquiry = Inquiry.new
    @categories = Category.all
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save!
      flash[:success] = "お問合せを受付けました。"
      @mail = InquiryMailer.accepted_inquiry(@inquiry)
      @mail.deliver
      redirect_to root_path
    else
      @categories = Category.all
      render 'new'
    end
  end
  
  def index
    @inquiries = Inquiry.order(created_at: :asc).paginate(page: params[:page])
    #@categories = Category.all
  end
  
  def show
    gmail = Gmail.new(MY_APP['ruby-gmail']['user'], 
                      MY_APP['ruby-gmail']['pass'])
    mails = gmail.inbox.emails(:unread).map do |mail|
      if md = mail.subject.match(/inquiry_id=(\d+)/)
        #puts md[0]
        response = Response.new
        response.created_at = mail.date
        response.updated_at = mail.date
        response.inquiry_id = md[1]
        response.content = mail.body.decoded.encode("UTF-8", mail.charset)
        #mail.text_part.decoded
        #mail.html_part.decoded
        response.save!
        inquiry = Inquiry.find(md[1])
        inquiry.update_attribute(:updated_at, mail.date)
        
        mail.mark(:read)
      end
    end
    gmail.disconnect

    
    
    @inquiry = Inquiry.find(params[:id])
    @responses = @inquiry.responses
    @response = Response.new
  end
  
  def destroy
    Inquiry.find(params[:id]).destroy
    flash[:success] = "削除しました。"
    redirect_to inquiries_url
  end
  
  private
    def inquiry_params
      params.require(:inquiry).permit(:name, :email, :category_id, :content)
    end
end
