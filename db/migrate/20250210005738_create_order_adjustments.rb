class CreateOrderAdjustments < ActiveRecord::Migration[8.0]
  def change
    create_table :order_adjustments do |t|
      t.references :order, null: false, foreign_key: true
      t.references :discount, null: false, foreign_key: true
      t.decimal :amount, precision: 24, scale: 2, default: 0.00, null: false

      t.timestamps
    end
  end
end
