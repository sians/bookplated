class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :check_signed_in, only: [:home]

  def home
  end

  def stats

  end

  def barchart
    @users_books = UsersBook.all.map { |record| record if current_user.id == record.user_id }
    @books = @users_books.map { |user_book| Book.find(user_book.book_id) }

    d3 = []
    @users_books.each_with_index do | user_book, index |
      record = {
        title: @books[index].title,
        date_read: user_book.date_read
      }
      d3 << record
    end
    # @data = d3.to_json
    render json: d3.to_json

    # respond_to do |format|
    #   format.json { render json: @data }
    # end
  end

  private

  def check_signed_in
    redirect_to user_books_path(current_user) if signed_in?
  end
end
