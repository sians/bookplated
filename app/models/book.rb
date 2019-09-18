class Book < ApplicationRecord
  has_many :authors_books, dependent: :destroy
  has_many :users_books, dependent: :destroy
  has_many :authors, through: :authors_books

  mount_uploader :photo, PhotoUploader

  include PgSearch::Model
  multisearchable against: [:title]
end
