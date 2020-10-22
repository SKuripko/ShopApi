class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.integer :sold_book_count

      t.timestamps
    end
  end
end
