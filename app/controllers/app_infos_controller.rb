# coding: utf-8
class AppInfosController < ApplicationController
  def index
    @apps = AppInfo.where(:app_type => 0).order('created_at DESC')
    @games = AppInfo.where(:app_type => 1).order('created_at DESC')
  end
  
  def show
    @app = AppInfo.find(params[:id])
  end
end
