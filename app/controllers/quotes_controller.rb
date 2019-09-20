class QuotesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @quote = Quote.new(quote_params)
    authorize @quote
    if @quote.save
      redirect_to user_book_path(current_user, @quote.users_book.book), notice: 'Quote added!'
    else
      redirect_to user_book_path(current_user, @quote.users_book.book), notice: 'Something went wrong!'
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def quote_params
    params.require(:quote).permit(:quote_text, :page_num, :users_book_id)
  end
end
