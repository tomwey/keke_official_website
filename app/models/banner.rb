class Banner < ActiveRecord::Base
  attr_accessible :app_id, :screenshot, :summary, :title
  
  validates_presence_of :title, :summary, :screenshot
  
  mount_uploader :screenshot, ScreenshotUploader
  
  belongs_to :app
  
  def app_name
    app.try(:name)
  end
  
  def platforms
    render_app_os_name(app)
  end
  
end
