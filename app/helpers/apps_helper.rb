# coding: utf-8
module AppsHelper
  
  def app_icon_width_for_size(size)
    case size
    when :normal then 48
    when :small then 16
    when :large then 64
    when :big then 120
    else size
    end
  end
  
  def render_app_type(app)
    app_type = if app.app_type == 0
      "应用"
    else
      "游戏"
    end
    app_type
  end
  
  def render_app_os_name(app)
    os = if app.os_type == 0
      "iOS"
    elsif app.os_type == 1
      "Android"
    else
      ""
    end
    os
  end
  
  def render_app_icon(app, size = :normal, opts = {})
    link = opts[:link] || true
    
    width = app_icon_width_for_size(size)
    
    if app.blank?
      return image_tag("avatar/#{size}.png")
    end
    
    if app.icon.blank?
      default_url = asset_path("avatar/#{size}.png")
      img = image_tag(default_url, :style => "width:#{width}px; height: #{width}px;")
    else
      img = image_tag(app.icon.url(size), :style => "width:#{width}px; height: #{width}px;")
    end
    
    if link
      raw %(<a href="#{cpanel_app_path(app)}">#{img}</a>)
    else
      raw img
    end
  end
end
