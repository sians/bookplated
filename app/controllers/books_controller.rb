class BooksController < ApplicationController
  before_action :fetch_book, only: %i[show edit update]

  def index
    @books = policy_scope(current_user.books).order(created_at: :desc)
  end

  def show
  end

  def new
    @book = Book.new
    authorize @book
  end

  def create
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
    params.require(:book).permit(:title, :year_published, :pages, :cover, :isbn, :users_book_id)
  end
end
