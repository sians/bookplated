class SearchController < ApplicationController
  def index
    @books = policy_scope(Book).order(created_at: :desc)
    if params[:query].present?
      results = PgSearch.multisearch(params[:query])
      @authors = []
      @books = []
      results.each do |result|
        if result[:searchable_type] == "Author"
          @authors << Author.find(result[:searchable_id])
        elsif result[:searchable_type] == "Book"
          book = Book.find(result[:searchable_id])
          @books << book if current_user.book_ids.include? book.id
        end
      end
      unless @authors.empty?
        @authors.each do |author|
          author.books.each { |book| @books << book if current_user.book_ids.include? book.id }
        end
      end
    end
    @partial = whitelisted_partial || 'grid'
    @query = params[:query]
  end

  private

  def whitelisted_partial
    %w(grid list).detect { |str| str == params[:view] }
  end
end
