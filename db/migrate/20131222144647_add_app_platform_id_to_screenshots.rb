class AddAppPlatformIdToScreenshots < ActiveRecord::Migration
  def change
    add_column :screenshots, :app_platform_id, :integer
    add_index :screenshots, :app_platform_id
  end
end
