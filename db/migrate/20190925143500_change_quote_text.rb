class ChangeQuoteText < ActiveRecord::Migration[5.2]
  def change
    change_column :quotes, :quote_text, :text
  end
end
