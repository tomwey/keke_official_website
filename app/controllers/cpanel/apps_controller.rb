# coding: utf-8
class Cpanel::AppsController < Cpanel::ApplicationController
  
  def index
    @apps = App.order('created_at DESC').paginate :page => params[:page], :per_page => 30
  end
  
  def show
    @app = App.find(params[:id])
  end
  
  def new
    @app = App.new
  end
  
  def create
    @app = App.new(params[:app])
    if @app.save
      redirect_to cpanel_apps_path, notice: "App created."
    else
      render :new
    end
  end
  
  def edit
    @app = App.find(params[:id])
  end
  
  def update
    @app = App.find(params[:id])
    if @app.update_attributes(params[:app])
      redirect_to cpanel_apps_path, notice: "App updated."
    else
      render :edit
    end
  end
  
  def destroy
    @app = App.find(params[:id])
    @app.destroy
    redirect_to cpanel_apps_url
  end
  
end
