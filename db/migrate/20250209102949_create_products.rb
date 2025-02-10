class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.references :supplier, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :status, default: 0
      t.string :sku
      t.decimal :price, precision: 24, scale: 2, default: 0.00, null: false

      t.timestamps
    end
  end
end
