class AddAdjustmentsTotalToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :adjustments_total, :decimal, precision: 24, scale: 2, default: 0.00, null: false
  end
end
