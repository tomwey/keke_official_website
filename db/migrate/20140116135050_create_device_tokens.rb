class CreateDeviceTokens < ActiveRecord::Migration
  def change
    create_table :device_tokens do |t|
      t.string :token
      t.integer :app_platform_id

      t.timestamps
    end
  end
end
