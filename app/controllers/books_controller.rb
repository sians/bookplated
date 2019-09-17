class BooksController < ApplicationController
  before_action :fetch_book, only: %i[show edit update]

  def index
    @books = policy_scope(current_user.books).order(created_at: :desc)
    @partial = whitelisted_partial || 'grid'
  end

  def show
    authorize @book
    @users_book = @book.users_books.where(:user_id == current_user.id).first
  end

  def new
    @book = Book.new
    authorize @book
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      @users_book = UsersBook.new
      @users_book.user = current_user
      @users_book.book = @book
    else
      render 'new'
    end
    params[:book][:author_ids].each do |id|
      unless id.empty?
        authors_book = AuthorsBook.new
        authors_book.book = @book
        authors_book.author = Author.find(id)
        authors_book.save
      end
    end
    if @users_book.save
      redirect_to user_books_path
    else
      render 'new'
    end
    authorize @book
  end

  def edit
  end

  def update
  end

  private

  def fetch_book
    @book = Book.find(params[:id])
    authorize @book
  end

  def book_params
    params.require(:book).permit(:title, :year_published, :pages, :cover, :isbn, :users_book_id, :author_ids, :photo)
  end

  def whitelisted_partial
    %w(grid list).detect { |str| str == params[:view] }
  end
end
