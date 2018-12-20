class AddUserReferenceToGroceries < ActiveRecord::Migration[5.2]
  def change
    add_reference :groceries, :user, index: true
  end
end
