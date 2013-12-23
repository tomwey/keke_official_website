# coding: utf-8
class Cpanel::AppPlatformsController < Cpanel::ApplicationController
  def index
    @app_platforms = AppPlatform.all
  end
  
  def show
    @app_platform = AppPlatform.find(params[:id])
  end
  
  def new
    @app_platform = AppPlatform.new
    @app_platform.screenshots.build
  end
  
  def create
    @app_platform = AppPlatform.new(params[:app_platform])
    if @app_platform.save
      redirect_to [:cpanel, @app_platform], :notice => "Created."
    else
      render :new
    end
  end
  
  def edit
    @app_platform = AppPlatform.find(params[:id])
  end
  
  def update
    @app_platform = AppPlatform.find(params[:id])
    if @app_platform.update_attributes(params[:app_platform])
      redirect_to [:cpanel, @app_platform], :notice => "App Platform Updated."
    else
      render :edit
    end
  end
  
  def destroy
    @app_platform = AppPlatform.find(params[:id])
    @app_platform.destroy
    redirect_to cpanel_app_platforms_url
  end
  
  
end
