class CreateTwitConfigs < ActiveRecord::Migration
  def change
    create_table :twit_configs do |t|
      t.integer :app_id
      t.string :dev_cert
      t.string :prod_cert

      t.timestamps
    end
    
    add_index :twit_configs, :app_id
  end
end
