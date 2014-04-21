class AddUtypeToNewsblasts < ActiveRecord::Migration
  def change
    add_column :newsblasts, :utype, :integer, :default => 3
    add_index :newsblasts, :utype
  end
end
