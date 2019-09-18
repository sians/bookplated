class Author < ApplicationRecord
  has_many :authors_books
  has_many :books, through: :authors_books

  include PgSearch::Model
  multisearchable against: [:first_name, :last_name]
end
