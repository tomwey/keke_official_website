class Feedback < ActiveRecord::Base
  attr_accessible :author, :content
  
  validates_presence_of :content
  
  belongs_to :app_platform
  
  def app_info
    "#{app_platform.app_name} - #{app_platform.name}"
  end
  
end
