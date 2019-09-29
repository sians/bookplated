class Note < ApplicationRecord
  belongs_to :users_book

  include PgSearch::Model
  multisearchable against: [:note_text]
end
