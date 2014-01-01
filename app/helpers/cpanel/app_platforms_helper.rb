# coding: utf-8
module Cpanel::AppPlatformsHelper
  def image_name_for_platform(pf)
    image_name = if pf.name == 'iOS'
      'btn_ios.png'
    elsif pf.name == 'Android'
      'btn_android.png'
    elsif pf.name == 'iOS越狱版'
      'btn_ios_cy.png'
    end
    image_name
  end
  
  def render_platform_link(pf)
    pf.app_download_url
  end
end
