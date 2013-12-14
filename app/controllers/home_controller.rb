class HomeController < ApplicationController
  
  def index
    @apps = AppInfo.order('created_at DESC')
  end
  
  def apps
    @apps = AppInfo.order('created_at DESC')
  end
  
  def about
    
  end
end
