class Screenshot < ActiveRecord::Base
  attr_accessible :image
  mount_uploader :image, ScreenshotUploader
  
  belongs_to  :app_platform
end
