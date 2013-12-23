class CreateAppPlatforms < ActiveRecord::Migration
  def change
    create_table :app_platforms do |t|
      t.integer :app_info_id
      t.string :version
      t.string :name
      t.string :app_key
      t.string :download

      t.timestamps
    end
    
    add_index :app_platforms, :app_info_id
    add_index :app_platforms, :app_key
  end
end
