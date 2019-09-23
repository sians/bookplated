class AuthorsController < ApplicationController
  before_action :fetch_author, only: %i[show]
  def index
  end

  def show
    authorize @author
    @books = @author.book_ids.map { |book| Book.find(book) if current_user.book_ids.include? book}
    @books.reject! { |item| item.blank? }
  end

  def new
  end

  def create
    @author = Author.new(author_params)
    @author.full_name = "#{@author.first_name} #{@author.last_name}"
    authorize @author
    if @author.save
      redirect_to new_user_book_path(current_user), notice: 'Author created!'
    else
      redirect_to new_user_book_path(current_user), notice: 'Could not create author'
    end
  end

  private

  def fetch_author
    @author = Author.find(params[:id])
    authorize @author
  end

  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end

end
