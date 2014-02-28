class DeviceToken < ActiveRecord::Base
  attr_accessible :app_id, :token
  
  belongs_to :app
  
  def app_name
    if app.blank?
      return ""
    end
    return app.name
  end
  
end
