# coding: utf-8
class AppInfo < ActiveRecord::Base
  attr_accessible :description, :icon, :name, :remove_icon, :icon_cache, :app_type
  
  validates_presence_of :name, :description, :app_type
  # validates_uniqueness_of :bundle_id, :app_id, :package_name
  
  # validates :bundle_id, uniqueness: true, allow_nil: true
  # validates :app_id, uniqueness: true, allow_nil: true
  # validates :package_name, uniqueness: true, allow_nil: true
  
  mount_uploader :icon, ImageUploader
  
  has_many :app_platforms, :dependent => :destroy
  # accepts_nested_attributes_for :app_platforms
  
  APP_TYPE = [['应用',0], ['游戏', 1]]
  
  def platform
    app_platforms.map { |app_platform| app_platform.name }.join(',')
  end
  
  def screenshots
    app_platforms.first.screenshots
  end
  
  # def version
  #   "1.0"
  # end
  
  # before_create :generate_app_key
  # def generate_app_key
  #   self.app_key = SecureRandom.uuid.gsub(/-/, '')
  # end
  
end
