class AddAppIdToAppPlatforms < ActiveRecord::Migration
  def change
    add_column :app_platforms, :app_id, :string
  end
end
