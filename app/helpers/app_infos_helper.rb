module AppInfosHelper
  
  def app_info_icon_width_for_size(size)
    case size
    when :normal then 48
    when :small then 16
    when :large then 64
    when :big then 120
    else size
    end
  end
  
  def app_info_icon_tag(app_info, size = :normal, opts = {})
    link = opts[:link] || true
    
    width = app_info_icon_width_for_size(size)
    
    if app_info.blank?
      return image_tag("avatar/#{size}.png")
    end
    
    if app_info.icon.blank?
      default_url = asset_path("avatar/#{size}.png")
      img = image_tag(default_url, :style => "width:#{width}px; height: #{width}px;")
    else
      img = image_tag(app_info.icon.url(size), :style => "width:#{width}px; height: #{width}px;")
    end
    
    if link
      raw %(<a href="#{cpanel_app_info_path(app_info)}">#{img}</a>)
    else
      raw img
    end
    
  end
end
