class AddScreenshotToAppPlatforms < ActiveRecord::Migration
  def change
    add_column :app_platforms, :screenshot, :string
  end
end
