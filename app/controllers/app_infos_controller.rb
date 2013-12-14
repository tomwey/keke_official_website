# coding: utf-8
class AppInfosController < ApplicationController
  def index
    @app_infos = AppInfo.order('created_at DESC')
  end
  
  def show
    @app = AppInfo.find(params[:id])
  end
end
