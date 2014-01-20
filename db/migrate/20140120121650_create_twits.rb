class CreateTwits < ActiveRecord::Migration
  def change
    create_table :twits do |t|
      t.string :content
      t.integer :app_platform_id
      t.string :sound

      t.timestamps
    end
    add_index :twits, :app_platform_id
  end
end
