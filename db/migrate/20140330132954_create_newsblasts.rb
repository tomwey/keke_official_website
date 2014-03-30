class CreateNewsblasts < ActiveRecord::Migration
  def change
    create_table :newsblasts do |t|
      t.string :title
      t.text :content
      t.string :link

      t.timestamps
    end
  end
end
