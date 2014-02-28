class DeviceToken < ActiveRecord::Base
  attr_accessible :app_id, :token
  
  belongs_to :app
  
  def app_name
    app.name
  end
  
end
