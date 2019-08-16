class CreateItemsMenusJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :items, :menus do |t|
      t.references :item, foreign_key: true
      t.references :menu, foreign_key: true
    end
  end
end
