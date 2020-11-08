class AddOrdersToStatistic < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :statistic, foreign_key: true, null: true 
  end
end
