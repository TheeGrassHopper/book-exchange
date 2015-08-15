class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :isbn
      t.string :author
      t.string :professor
      t.integer :book_type
      t.integer :condition
      t.decimal :price
      t.text :description

      t.timestamps null: false
    end
  end
end
