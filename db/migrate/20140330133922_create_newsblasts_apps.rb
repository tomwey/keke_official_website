class CreateNewsblastsApps < ActiveRecord::Migration
  def change
    create_table :apps_newsblasts, :id => false do |t|
      t.integer  :app_id
      t.integer  :newsblast_id
    end
    
    add_index :apps_newsblasts, [:app_id, :newsblast_id]
  end
end
