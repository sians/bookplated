class Quote < ApplicationRecord
  belongs_to :users_book

  include PgSearch::Model
  multisearchable against: [:quote_text]
end
