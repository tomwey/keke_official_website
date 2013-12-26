class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :bundle_id
      t.string :os_version
      t.string :bundle_version
      t.string :model
      t.string :region_code
      t.string :screen_size
      t.integer :app_platform_id

      t.timestamps
    end
    add_index :tracks, :app_platform_id
  end
end
