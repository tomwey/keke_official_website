class RemoveColumns < ActiveRecord::Migration
  def up
    remove_column :app_infos, :platform
    remove_column :app_infos, :version
    remove_column :app_infos, :bundle_id
    remove_column :app_infos, :package_name
    remove_column :app_infos, :app_id
    remove_column :app_infos, :app_key
  end

  def down
  end
end
