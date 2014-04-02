# coding: utf-8
class Cpanel::TwitConfigsController < Cpanel::ApplicationController
  
  def index
    @twit_configs = TwitConfig.order('created_at DESC').paginate :page => params[:page], :per_page => 30
  end
  
  def new
    @twit_config = TwitConfig.new
  end
  
  def create
    @twit_config = TwitConfig.new(params[:twit_config])
    if @twit_config.save
      redirect_to cpanel_twit_configs_url, notice: "创建推送配置成功"
    else
      render :new
    end
  end
  
  def edit
    @twit_config = TwitConfig.find(params[:id])
  end
  
  def update
    @twit_config = TwitConfig.find(params[:id])
    if @twit_config.update_attributes(params[:twit_config])
      redirect_to cpanel_twit_configs_url, notice: "更新推送配置成功"
    else
      render :edit
    end
  end
  
  def destroy
    @twit_config = TwitConfig.find(params[:id])
    @twit_config.destroy
    redirect_to cpanel_twit_configs_url
  end
  
end
