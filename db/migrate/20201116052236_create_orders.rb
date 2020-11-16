class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :zipcode
      t.string :address
      t.integer :payment
      t.integer :shipfee
      t.integer :order_status

      t.timestamps
    end
  end
end
