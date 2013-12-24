# coding: utf-8
class Cpanel::SiteConfigsController < Cpanel::ApplicationController
  def index
    @site_configs = SiteConfig.order("id DESC")
  end
  
  def edit
    @site_config = SiteConfig.find(params[:id])
  end
  
  def update
    @site_config = SiteConfig.find(params[:id])
    if @site_config.update_attributes(params[:site_config])
      redirect_to edit_cpanel_site_config_path(@site_config), :notice => "配置更新成功。"
    else
      render :edit
    end
  end
  
end