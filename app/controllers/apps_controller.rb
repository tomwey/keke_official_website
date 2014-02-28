# coding: utf-8
class AppsController < ApplicationController
  def index
    @apps = App.apps.published.latest_published
    @games = App.games.published.latest_published
  end
  
  def show
    @app = App.find(params[:id])
  end
end
