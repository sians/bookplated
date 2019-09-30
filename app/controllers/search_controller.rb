class SearchController < ApplicationController
  def index
    @books = policy_scope(Book).order(created_at: :desc)
    if params[:query].present?
      results = PgSearch.multisearch(params[:query])
      @authors = [] #only authors with books in user library
      @books = [] #only books with query in title
      @books_of_authors = [] #books of an author, when query is author's name
      @quotes = [] #quotes with query in quote_text
      @notes = [] #notes with query in note_text
      results.each do |result|
        if result[:searchable_type] == "Author"
          author = Author.find(result[:searchable_id])
          current_user.users_books.each do |users_book|
            @authors << author if users_book.book.author_ids.include? author.id
          end
          @authors.uniq!
        elsif result[:searchable_type] == "Book"
          book = Book.find(result[:searchable_id])
          @books << book if current_user.book_ids.include? book.id
        elsif result[:searchable_type] == "Quote"
          quote = Quote.find(result[:searchable_id])
          @quotes << quote if quote.users_book.user_id == current_user.id
        elsif result[:searchable_type] == "Note"
          note = Note.find(result[:searchable_id])
          @notes << note if note.users_book.user_id == current_user.id
        end
      end
      unless @authors.empty?
        @authors.each do |author|
          author.books.each { |book| @books_of_authors << book if current_user.book_ids.include? book.id }
        end
      end
    end
    @partial = whitelisted_partial || 'grid'
    @query = params[:query]
  end

  def fetch_books
    skip_authorization
    x = GoodreadsScrapeService.new(params[:title])
    @top_three = x.fetchSearchResults
  end

  private

  def whitelisted_partial
    %w(grid list).detect { |str| str == params[:view] }
  end
end
