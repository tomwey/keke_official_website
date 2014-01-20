# coding: utf-8
class Cpanel::TwitsController < Cpanel::ApplicationController
  
  def index
    @twits = Twit.order('created_at DESC').paginate :page => params[:page], :per_page => 30
  end
  
  def new
    @twit = Twit.new
  end
  
  def create
    @twit = Twit.new(params[:twit])
    if @twit.save
      redirect_to cpanel_twits_url, notice: "创建推送成功"
    else
      render :new
    end
  end
  
end
