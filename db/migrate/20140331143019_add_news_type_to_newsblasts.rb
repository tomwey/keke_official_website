class AddNewsTypeToNewsblasts < ActiveRecord::Migration
  def change
    add_column :newsblasts, :news_type, :integer, :default => 1
  end
end
