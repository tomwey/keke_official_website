class ChangeNewsblasts < ActiveRecord::Migration
  def change
    rename_column :newsblasts, :link, :url
    add_column :newsblasts, :show_times, :integer, :default => 0
  end

end
