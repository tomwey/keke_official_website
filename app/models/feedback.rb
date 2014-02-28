class Feedback < ActiveRecord::Base
  attr_accessible :author, :content, :model, :os_version
  
  validates_presence_of :content
  
  belongs_to :app
  
  def app_info
    if app.blank?
      return ""
    end
    
    if app.os_type == 0
      os = "iOS"
    else
      os = "Android"
    end
    
    return "#{app.name} - #{os}"
  end
  
end
