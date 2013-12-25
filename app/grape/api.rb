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
        requires :app_key, type: String, desc: "应用程序标示"
        requires :content, type: String, desc: "反馈正文"
        optional :author, type: String, desc: "联系方式"
      end
      post do
        ap = AppPlatform.find_by_app_key(params[:app_key])
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
    
  end
end