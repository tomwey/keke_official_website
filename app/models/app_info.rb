class AppInfo < ActiveRecord::Base
  attr_accessible :app_id, :bundle_id, :description, :icon, :name, :package_name, :platform, :version
end
