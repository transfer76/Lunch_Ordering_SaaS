class RemoveItemsOrders < ActiveRecord::Migration[5.2]
  def up
    drop_table :items_orders
    change_table :orders do |t|
      t.integer :first_course_id, index: true
      t.integer :main_course_id, index: true
      t.integer :drink_id, index: true
    end
  end
end
