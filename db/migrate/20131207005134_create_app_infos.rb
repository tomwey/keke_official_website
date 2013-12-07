class CreateAppInfos < ActiveRecord::Migration
  def change
    create_table :app_infos do |t|
      t.string :name
      t.text :description
      t.string :platform
      t.string :icon
      t.string :version
      t.string :bundle_id
      t.string :package_name
      t.string :app_id

      t.timestamps
    end
    
    add_index :app_infos, :bundle_id, :unique => true
    add_index :app_infos, :app_id, :unique => true
    add_index :app_infos, :package_name, :unique => true 
    
  end
end
