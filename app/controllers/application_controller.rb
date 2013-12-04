# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def set_seo_meta(title = '', meta_keyword = '', meta_description = '')
    if title.length > 0
      @page_title = "#{title}"
    end
    @meta_keywords = meta_keyword
    @meta_description = meta_description
  end
end
