class AddAppTypeToAppInfos < ActiveRecord::Migration
  def change
    add_column :app_infos, :app_type, :integer, :default => 0
    add_index :app_infos, :app_type
  end
end
