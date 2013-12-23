class RemoveScreenshotFromAppPlatforms < ActiveRecord::Migration
  def up
    remove_column :app_platforms, :screenshot
  end

  def down
  end
end
