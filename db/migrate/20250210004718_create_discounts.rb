class CreateDiscounts < ActiveRecord::Migration[8.0]
  def change
    create_table :discounts do |t|
      t.string :name, null: false
      t.decimal :amount, precision: 24, scale: 2, default: 0.00, null: false
      t.integer :limit, default: 1

      t.timestamps
    end
  end
end
