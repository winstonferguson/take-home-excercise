class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.integer :status, default: 0
      t.string :token, null: false

      t.timestamps
    end
  end
end
