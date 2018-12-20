class RemoveCategoryColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :groceries, :category
  end
end
