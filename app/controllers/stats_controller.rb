class StatsController < ApplicationController
  skip_after_action :verify_authorized

  def barchart
    @users_books = UsersBook.all.map { |record| record if current_user.id == record.user_id }
    @books = @users_books.map { |user_book| Book.find(user_book.book_id) }

    # combine data from Book & UsersBook models to create an array of record
    records = []
    # create an array of the years where a book has been read
    years = []
    @users_books.each_with_index do | user_book, index |
      if user_book.date_read
        record = {
          title: @books[index].title,
          year_read: user_book.date_read.year,
          month_read: user_book.date_read.month,
          day_read: user_book.date_read.day
        }
        records << record
        years << record[:year_read] unless years.include? record[:year_read]
      end
    end

    # create an array of objects to input into the d3 chart
    data = []
    (years.min..years.max).each do |year|
      object = {}
      object[:year] = year
      object[:books] = []
      records.each do |record|
        object[:books] << record if record[:year_read] == year
      end
      data << object
    end

    # get array to count the number of books read each year
    num_books = data.map do |object|
      object[:books].length
    end

    d3 = {
      data: data,
      minYear: years.min,
      maxYear: years.max,
      minRead: num_books.min,
      maxRead: num_books.max
    }

    render json: d3.to_json
  end
end
