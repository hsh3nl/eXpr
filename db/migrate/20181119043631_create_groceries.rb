class CreateGroceries < ActiveRecord::Migration[5.2]
  def change
    create_table :groceries do |t|
      t.string :ingredient
      t.string :type
      t.string :start_date, null: false
      t.string :expired_date, null: false
      t.timestamps
    end
  end
end
