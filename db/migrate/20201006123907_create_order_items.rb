class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.float :total
      t.integer :quantity, default: 1
      t.references :product, null: true, foreign_key: true
      t.belongs_to :cart, null: true, foreign_key: true

      t.timestamps
    end
  end
end
