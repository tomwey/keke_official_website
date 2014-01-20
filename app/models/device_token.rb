class DeviceToken < ActiveRecord::Base
  attr_accessible :app_platform_id, :token
  
  belongs_to :app_platform
  
  def app_name
    app_platform.app_name
  end
  
end
