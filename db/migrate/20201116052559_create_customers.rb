class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :family_name
      t.string :family_name_kana
      t.string :first_name
      t.string :first_name_kana
      t.string :email
      t.string :password
      t.string :phone_number
      t.string :zipcode
      t.string :address
      t.boolean :is_deleted, default: false, null: false
      t.timestamps
    end
  end
end
