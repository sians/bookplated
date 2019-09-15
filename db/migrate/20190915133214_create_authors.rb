class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.integer :birth_year
      t.string :nationality
      t.integer :death_year
      t.string :gender

      t.timestamps
    end
  end
end
