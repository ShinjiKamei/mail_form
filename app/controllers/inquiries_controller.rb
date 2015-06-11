class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      flash[:success] = "お問合せを受付けました。"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  
  private
    def inquiry_params
      params.require(:inquiry).permit(:name, :email, :category_id, :content)
    end
end
