class AddUniqueIndexOnDateToMenu < ActiveRecord::Migration[5.2]
  def change
    remove_index :menus, :date
    add_index :menus, :date, unique: true
  end
end
