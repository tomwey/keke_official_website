# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  def render_404
    render_optional_error_file(404)
  end
  
  def render_403
    render_optional_error_file(403)
  end
  
  def render_optional_error_file(code)
    status = code.to_s
    if %w(404 403 422 500).include?(status)
      render :template => "/errors/#{status}.html.erb", :status => status, :layout => "application"
    else
      render :template => "/errors/unknown.html.erb", :status => status, :layout => "application"
    end
  end
  
  def require_user
    if current_user.blank?
      respond_to do |format|
        format.html {
          authenticate_user!
        }
        format.all {
          head(:unauthorized)
        }
      end
    end
  end
  
  def set_seo_meta(title = '', meta_keyword = '', meta_description = '')
    if title.length > 0
      @page_title = "#{title}"
    end
    @meta_keywords = meta_keyword
    @meta_description = meta_description
  end
end
