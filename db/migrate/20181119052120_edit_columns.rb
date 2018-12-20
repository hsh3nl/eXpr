class EditColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :groceries, :type, :category
    remove_column :groceries, :start_date
    change_column :groceries, :expired_date, 'date USING CAST(expired_date AS date)', null: false
  end
end
