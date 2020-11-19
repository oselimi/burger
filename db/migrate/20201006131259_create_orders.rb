class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :no
      t.datetime :date
      t.timestamps
    end
  end
end
