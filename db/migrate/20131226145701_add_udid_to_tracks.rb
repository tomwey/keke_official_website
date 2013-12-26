class AddUdidToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :udid, :string
  end
end
