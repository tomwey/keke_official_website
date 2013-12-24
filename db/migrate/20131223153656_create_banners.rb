class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.integer :app_info_id
      t.string :title
      t.string :summary
      t.string :screenshot

      t.timestamps
    end
    add_index :banners, :app_info_id
  end
end
