# coding: utf-8
class Cpanel::DeviceTokensController < Cpanel::ApplicationController
  
  def index
    @device_tokens = DeviceToken.order('created_at DESC').paginate :page => params[:page], :per_page => 30
  end
  
  # def show
  #   @track = Track.find(params[:id])
  # end
  
  def destroy
    @device_token = DeviceToken.find(params[:id])
    @device_token.destroy
    redirect_to cpanel_device_tokens_url
  end
  
end
