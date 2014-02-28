class ChangeColumn < ActiveRecord::Migration
  def up
    rename_column :banners, :app_info_id, :app_id
    rename_column :feedbacks, :app_platform_id, :app_id
    rename_column :tracks, :app_platform_id, :app_id
    rename_column :device_tokens, :app_platform_id, :app_id
    rename_column :twits, :app_platform_id, :app_id
    add_index :banners, :app_id
    add_index :feedbacks, :app_id
    add_index :tracks, :app_id
    add_index :device_tokens, :app_id
    add_index :twits, :app_id
  end

  def down
  end
end
