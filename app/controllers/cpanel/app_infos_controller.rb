# coding: utf-8
class Cpanel::AppInfosController < Cpanel::ApplicationController
  
  def index
    @apps = AppInfo.order('created_at DESC').paginate :page => params[:page], :per_page => 30
  end
  
  def show
    @app = AppInfo.find(params[:id])
  end
  
  def new
    @app_info = AppInfo.new
    @app_platform = @app_info.app_platforms.build
  end
  
  def create
    @app_info = AppInfo.new(params[:app_info])
    if @app_info.save
      redirect_to cpanel_app_infos_path, notice: "App created."
    else
      render :new
    end
  end
  
  def edit
    @app_info = AppInfo.find(params[:id])
  end
  
  def update
    @app_info = AppInfo.find(params[:id])
    if @app_info.update_attributes(params[:app_info])
      redirect_to cpanel_app_infos_path, notice: "App updated."
    else
      render :edit
    end
  end
  
  def destroy
    @app_info = AppInfo.find(params[:id])
    @app_info.destroy
    redirect_to cpanel_app_infos_url
  end
  
end
