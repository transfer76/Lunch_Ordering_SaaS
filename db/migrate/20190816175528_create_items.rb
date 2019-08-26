class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :course
      t.string :name
      t.decimal :price
      t.string :photo

      t.timestamps
    end
  end
end
