class AddTotalsToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :subtotal, :decimal, precision: 24, scale: 2, default: 0.00, null: false
    add_column :orders, :total, :decimal, precision: 24, scale: 2, default: 0.00, null: false
  end
end
