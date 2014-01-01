class AddDescriptionToScreenshots < ActiveRecord::Migration
  def change
    add_column :screenshots, :description, :string
  end
end
