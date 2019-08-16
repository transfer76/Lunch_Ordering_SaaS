class CreateItemsOrdersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :items, :orders do |t|
      t.references :item, foreign_key: true
      t.references :order, foreign_key: true
    end
  end
end
