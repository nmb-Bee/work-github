class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :explanation
      t.integer :non_taxed_price
      t.string :image
      t.boolean :on_sale

      t.timestamps
    end
  end
end
