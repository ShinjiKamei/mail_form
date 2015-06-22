require 'gmail'

class ResponsesController < ApplicationController
  
  def create
    @response = Response.new(response_params)
    if @response.save!
      @mail = InquiryMailer.response(@response)
      @mail.deliver
      flash[:success] = "回答を送信しました。"
      @inquiry = Inquiry.find(@response.inquiry_id)
      redirect_to @inquiry
    else
      render 'show'
    end
  end

  def destroy
    @response = Response.find(params[:id])
    @response.destroy
    flash[:success] = "削除しました。"
    @inquiry = Inquiry.find(@response.inquiry_id)
    redirect_to @inquiry
  end
  
  private
    def response_params
      params.require(:response).permit(:inquiry_id, :content)
    end
end
