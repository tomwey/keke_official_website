class Banner < ActiveRecord::Base
  attr_accessible :app_id, :screenshot, :summary, :title, :url
  
  validates_presence_of :title, :summary, :screenshot
  
  mount_uploader :screenshot, ScreenshotUploader
  
  belongs_to :app
  
  def app_name
    app.try(:name)
  end
  
  def link
    self.url || self.app.app_url
    l = if self.url.blank?
      self.app.try(:app_url)
    else
      self.url
    end
    l
  end
  
  def platforms
    render_app_os_name(app)
  end
  
end
