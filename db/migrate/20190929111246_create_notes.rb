class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :note_text
      t.integer :page_num
      t.references :users_book, foreign_key: true

      t.timestamps
    end
  end
end
