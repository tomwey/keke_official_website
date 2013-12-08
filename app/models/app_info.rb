class AppInfo < ActiveRecord::Base
  attr_accessible :app_id, :bundle_id, :description, :icon, :name, :package_name, :platform, :version
  
  validates_presence_of :name, :version, :platform, :description
  # validates_uniqueness_of :bundle_id, :app_id, :package_name
  
  # validates :bundle_id, uniqueness: true, allow_nil: true
  # validates :app_id, uniqueness: true, allow_nil: true
  # validates :package_name, uniqueness: true, allow_nil: true
  
  mount_uploader :icon, ImageUploader
  
  def version
    "1.0"
  end
  
  before_create :generate_app_key
  def generate_app_key
    self.app_key = SecureRandom.uuid.gsub(/-/, '')
  end
  
end
