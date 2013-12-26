class AddIndexToTracks < ActiveRecord::Migration
  def change
    add_index :tracks, :udid, :unique => true
  end
end
