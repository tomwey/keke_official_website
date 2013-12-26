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
      end
      post do
        ap = AppPlatform.find_by_app_key(params[:key])
        if ap.blank?
          return render_404_json
        end
        if ap.feedbacks.create(:author => params[:author], :content => params[:content])
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
        ap = AppPlatform.find_by_app_key(params[:key])
        if ap.blank?
          return render_404_json
        end
        
        track = ap.tracks.find_by_udid(params[:u])
        if track.blank?
          if ap.tracks.create(
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
    
  end
end