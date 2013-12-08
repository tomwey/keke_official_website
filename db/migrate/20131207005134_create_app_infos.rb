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
    
  end
end
