class AppPlatform < ActiveRecord::Base
  attr_accessible :app_info_id, :app_key, :download, :name, :version, :app_id, :screenshots_attributes
  
  belongs_to :app_info
  
  validates_presence_of :name, :version, :app_info_id
  
  mount_uploader :download, AppUploader
  
  has_many :screenshots
  accepts_nested_attributes_for :screenshots, :reject_if => lambda { |a| a[:image].blank? }, :allow_destroy => true
  
  def app_name
    app_info.name
  end
  
  before_create :generate_app_key
  def generate_app_key
    self.app_key = SecureRandom.uuid.gsub(/-/, '')
  end
  
  def app_download_url
    app_url = if self.download_url
      download_url
    else
      "https://itunes.apple.com/id#{app_id}"
    end
    app_url
  end
  
end
