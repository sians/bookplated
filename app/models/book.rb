class Book < ApplicationRecord
  has_many :authors_books
  has_many :users_books
  has_many :authors, through: :authors_books

  mount_uploader :cover, PhotoUploader

end
