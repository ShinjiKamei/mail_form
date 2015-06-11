class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      # 保存の成功をここで扱う。
    else
      render 'new'
    end
  end
  
  
  private
    def inquiry_params
      params.require(:inquiry).permit(:name, :email, :category_id, :content)
    end
end
