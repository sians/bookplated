class UsersBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :quotes
  has_many :notes
end
