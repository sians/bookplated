class StatsController < ApplicationController
  skip_after_action :verify_authorized

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
    render json: d3.to_json
  end

end
