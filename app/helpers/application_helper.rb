# coding: utf-8
module ApplicationHelper
  def render_page_title
    site_name = Setting.app_name
    title = @page_title ? "#{site_name} - #{@page_title}" : site_name rescue "SITE_NAME"
    content_tag("title", title, nil, false)
  end
end
