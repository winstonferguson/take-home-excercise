class AddTokenIndexToOrders < ActiveRecord::Migration[8.0]
  def change
    add_index :orders, :token, unique: true
  end
end
