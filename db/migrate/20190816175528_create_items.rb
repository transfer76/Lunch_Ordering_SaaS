class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :type
      t.string :name
      t.decimal :price
      t.string :photo
      t.references :order, foreign_key: true
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end
