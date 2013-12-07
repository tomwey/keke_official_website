class RemoveIndexesFromAppInfos < ActiveRecord::Migration
  def up
    remove_index :app_infos, :app_id
    remove_index :app_infos, :bundle_id
    remove_index :app_infos, :package_name
  end

  def down
  end
end
