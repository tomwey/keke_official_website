# coding: utf-8
class HomeController < ApplicationController
  
  def index
    @apps = AppInfo.order('created_at DESC')
    @banners = Banner.order('created_at DESC').limit(3)
    @app_infos = AppInfo.order('created_at DESC').limit(3)
    @questions = Question.order('created_at DESC').limit(3)
    
    @page_title = "专注于移动互联网产品研发和手机游戏开发，为用户提供高品质软件和游戏是我们不变的追求！"
    @meta_keywords = "移动互联网,手机游戏,Cocos2d-X,iOS,Android,Unity3D,法律,教育,儿童"
    @meta_description = "成都可可科技(KEKESTUDIO.COM)-一直专注于移动互联网产品的研发和手机游戏的开发，目前我们的产品主要包括法律类的应用以及益智类的手机游戏，我们一直努力做出优秀的产品，给您的生活以及娱乐带来愉悦的体验！"
  end
  
  def apps
    @apps = AppInfo.order('created_at DESC')
    @page_title = "我们的产品"
  end
  
  def about
    @page_title = "关于我们"
  end
end
