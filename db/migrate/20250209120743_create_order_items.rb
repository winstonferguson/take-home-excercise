class CreateOrderItems < ActiveRecord::Migration[8.0]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity, default: 1
      t.decimal :price, precision: 24, scale: 2, default: 0.00, null: false
      t.decimal :subtotal, precision: 24, scale: 2, default: 0.00, null: false

      t.timestamps
    end
  end
end
