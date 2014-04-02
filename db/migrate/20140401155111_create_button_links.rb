class CreateButtonLinks < ActiveRecord::Migration
  def change
    create_table :button_links do |t|
      t.string :title
      t.string :link
      t.integer :newsblast_id

      t.timestamps
    end
    add_index :button_links, :newsblast_id
  end
end
