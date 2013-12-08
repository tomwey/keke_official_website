class AddAppKeyToAppInfos < ActiveRecord::Migration
  def change
    add_column :app_infos, :app_key, :string
    add_index :app_infos, :app_key, :unique => true
  end
end
