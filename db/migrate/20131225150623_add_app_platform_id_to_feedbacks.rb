class AddAppPlatformIdToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :app_platform_id, :integer
    add_index :feedbacks, :app_platform_id
  end
end
