class AddBadgeToTwits < ActiveRecord::Migration
  def change
    add_column :twits, :badge, :integer, :default => 0
  end
end
