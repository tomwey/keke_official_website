class AddModelAndOsVersionToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :model, :string
    add_column :feedbacks, :os_version, :string
  end
end
