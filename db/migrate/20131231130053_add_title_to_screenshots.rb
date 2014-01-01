class AddTitleToScreenshots < ActiveRecord::Migration
  def change
    add_column :screenshots, :title, :string
  end
end
