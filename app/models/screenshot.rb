class Screenshot < ActiveRecord::Base
  attr_accessible :image, :description, :title
  
  validates_presence_of :image
  
  mount_uploader :image, ScreenshotUploader
  
  belongs_to  :app_platform
end
