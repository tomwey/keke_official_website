class AddIsDebugToTwits < ActiveRecord::Migration
  def change
    add_column :twits, :is_debug, :boolean, :default => false
  end
end
