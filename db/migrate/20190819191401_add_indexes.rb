class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :items, :name
    add_index :menus, :date
    add_index :orders, :id
  end
end
