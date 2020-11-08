class CreateCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :costs do |t|
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
