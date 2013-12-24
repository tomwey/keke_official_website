class HomeController < ApplicationController
  
  def index
    @apps = AppInfo.order('created_at DESC')
    @banners = Banner.order('created_at DESC').limit(3)
  end
  
  def apps
    @apps = AppInfo.order('created_at DESC')
  end
  
  def about
    
  end
end
