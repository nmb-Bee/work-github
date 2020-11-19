class ChangeIsDeletedToCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :customers, :is_deleted, default: false, null: false
  end
end
