class Track < ActiveRecord::Base
  attr_accessible :app_platform_id, :bundle_id, :bundle_version, :model, :os_version, :region_code, :screen_size, :udid
  
  validates_presence_of :bundle_id, :bundle_version, :os_version, :model, :udid
  
  validates_uniqueness_of :udid
  
  belongs_to :app_platform
  
  def app_name
    app_platform.app_name
  end
end
