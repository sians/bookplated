class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :quote_text
      t.integer :page_num
      t.references :users_book, foreign_key: true

      t.timestamps
    end
  end
end
