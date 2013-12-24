class Banner < ActiveRecord::Base
  attr_accessible :app_info_id, :screenshot, :summary, :title
  
  validates_presence_of :title, :summary, :screenshot
  
  mount_uploader :screenshot, ScreenshotUploader
  
  belongs_to :app_info
  
  def app_name
    app_info.try(:name)
  end
  
  def platforms
    app_info.app_platforms
  end
end
