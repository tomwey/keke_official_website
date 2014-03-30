# coding: utf-8
require "helpers"

module KeKe
  class API < Grape::API
    prefix :api
    format :json
    version 'v1'
    
    helpers APIHelpers
    
    # 用户反馈
    resources :feedbacks do
      params do
        requires :key, type: String, desc: "应用程序标示"
        requires :content, type: String, desc: "反馈正文"
        optional :author, type: String, desc: "联系方式"
        optional :m, type: String, desc: "设备名称，例如iPhone_3G"
        optional :ov, type: String, desc: "设备系统版本号，例如6.1.3"
      end
      post do
        ap = App.find_by_app_key(params[:key])
        if ap.blank?
          return render_404_json
        end
        if ap.feedbacks.create(:author => params[:author], :content => params[:content], :model => params[:m], :os_version => params[:ov])
          render_success
        else
          render_error_json_no_data(4001, "创建反馈失败")
        end
      end
    end
    
    # 数据统计
    resources :tracks do
      params do
        requires :key, type: String, desc: "应用程序标示"
        requires :u, type: String, desc: "设备标示"
        requires :b, type: String, desc: "iOS中的bundle id或android中的包名"
        requires :ov, type: String, desc: "操作系统版本"
        requires :bv, type: String, desc: "应用当前版本"
        requires :m, type: String, desc: "设备名称"
        requires :c, type: String, desc: "地区编码"
        requires :d, type: String, desc: "设备屏幕分辨率"
      end
      
      post do
        ap = App.find_by_app_key(params[:key])
        if ap.blank?
          return render_404_json
        end
        
        track = ap.tracks.find_by_udid(params[:u])
        if track.blank?
          if ap.tracks.create!(
            :udid => params[:u],
            :bundle_id => params[:b],
            :os_version => params[:ov],
            :bundle_version => params[:bv],
            :model => params[:m],
            :region_code => params[:c],
            :screen_size => params[:d]
            )
            
            render_success
          else
            render_error_json_no_data(4001, "创建统计失败")
          end
        end
        
      end
      
    end # end tracks
    
    # 推送注册接口
    resources :push_gateway do
      # iOS推送注册接口
      params do
        requires :token, type: String, desc: "64字节的device token"
        requires :key, type: String, desc: "应用程序key"
      end
      
      post '/register' do
        ap = App.find_by_app_key(params[:key])
        if ap.blank?
          return render_404_json
        end
        
        dt = DeviceToken.where(:token => params[:token]).first
        unless dt
          dt = DeviceToken.new(:token => params[:token])
          dt.app = ap
          if dt.save
            render_success
          else
            render_error_json_no_data(4001, "注册推送失败")
          end
        else
          render_error_json_no_data(4001, "该设备已经注册")
        end
      end # end iOS推送注册
      
    end # end 推送注册接口
    
    # Newsblast接口
    resource :news do
      params do
        requires :key, type: String, desc: "应用程序key"
      end
      
      get '/' do
        app = App.find_by_app_key(params[:key])
        if app.blank?
          return render_404_json
        end
        
        news = app.newsblasts.sample(1)
        
        unless news
          return render_404_json
        end
        
        { code: 0, message: 'ok', data: news }
        
      end # end news.json
    end # end Newsblast接口
    
  end
end