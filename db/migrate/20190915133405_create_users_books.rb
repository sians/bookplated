class CreateUsersBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :users_books do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.string :notes
      t.datetime :date_read
      t.boolean :owned
      t.boolean :read

      t.timestamps
    end
  end
end
