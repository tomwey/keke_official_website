# coding: utf-8
class App < ActiveRecord::Base
  attr_accessible :app_key, :app_url, :icon, :intro, :name, :os_type, :published_at, :app_type, :version, :icon_cache
  
  validates_presence_of :app_key, :intro, :name, :os_type, :app_type, :version
  validates_uniqueness_of :app_key
  
  mount_uploader :icon, ImageUploader
  
  has_many :feedbacks
  has_many :tracks
  
  has_and_belongs_to_many :newsblasts
  
  scope :apps, where(:app_type => 0)
  scope :games, where(:app_type => 1)
  scope :published, where('published_at is not null')
  scope :latest_published, order('published_at DESC')
  
  TYPE = [['应用', 0], ['游戏', 1]]
  OS_TYPE = [['iOS', 0], ['Android', 1]]
  
  after_initialize :generate_app_key
  def generate_app_key
    if new_record?
      self.app_key = SecureRandom.uuid.gsub(/-/, '')
    end
  end
  
end
