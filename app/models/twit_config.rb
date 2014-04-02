class TwitConfig < ActiveRecord::Base
  attr_accessible :app_id, :dev_cert, :prod_cert, :dev_cert_cache, :prod_cert_cache
  
  belongs_to :app
  
  mount_uploader :dev_cert, FileUploader
  mount_uploader :prod_cert, FileUploader
  
  validates_presence_of :app_id, :dev_cert, :prod_cert
  
end
