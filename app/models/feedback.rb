class Feedback < ActiveRecord::Base
  attr_accessible :author, :content, :model, :os_version
  
  validates_presence_of :content
  
  belongs_to :app
  
  def app_info
    if app.blank?
      return ""
    end
    return "#{app.name} - #{render_app_os_name(app)}"
  end
  
end
