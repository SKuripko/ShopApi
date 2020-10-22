class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.integer :shop_id
      t.string :author
      t.string :book_title
      t.integer :copie_count

      t.timestamps
    end
  end
end
