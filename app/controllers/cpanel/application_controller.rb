# coding: utf-8
class Cpanel::ApplicationController < ApplicationController
  
  layout "cpanel"
  before_filter :require_user
  before_filter :require_admin
  
  def require_admin
    if not Setting.admin_emails.include?(current_user.email)
      render_404
    end
  end
  
  def render_header_list(h2, link_text, url)
   html = render(:partial => "common/cpanel/header_list", 
                 :locals => { :h2 => h2, :link_text => link_text, :url => url }).join("\n").html_safe
   html
  end
  helper_method :render_header_list
  
end
