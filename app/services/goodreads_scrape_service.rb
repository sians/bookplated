require 'nokogiri'
require 'open-uri'

class GoodreadsScrapeService
  def initialize(query)
    @base_url = "https://www.goodreads.com/search?q="
    @query = query
  end

  def fetchSearchResults
    raw_html = open(cleanURL).read
    document = Nokogiri::HTML(raw_html)
    cleanSearchResults(document) # array of TOP 3 book hashes
  end

  def fetchBookDetails(book)
    raw_html = open(book["book_url"]).read
    document = Nokogiri::HTML(raw_html)
    extractBookDetails(document, book)
  end

  private

  def cleanURL
    clean_query = @query.downcase.gsub(" ", "+")
    @base_url + clean_query
  end

  def cleanSearchResults(document)
    top_3 = document.search("tr[itemscope]")[0...3]
    top_3.map do |result|
      {
        title: result.search("a.bookTitle").text.gsub("\n","").strip,
        author: result.search("a.authorName").text,
        cover_url: result.search("img.bookCover").first.attributes["src"].value,
        book_url: "https://www.goodreads.com#{result.search("a.bookTitle").first.attributes["href"].value}"
      }
    end
  end

  def extractBookDetails(document, book)
    year = document.search("nobr.greyText").text.strip.split(" ")
    year = year.last.remove(")", "").to_i unless year.empty?
    cover = book[:cover_url].gsub("i/", "l/").gsub("_SY75", "_SY475")
    book_details = {
      pages: document.search("span[itemprop='numberOfPages']").text.remove(" pages",""),
      year_published: year,
      cover: cover,
      isbn: document.search("span[itemprop='isbn']").text.to_i,
      title: book[:title]
    }
    author_details = {
      first_name: book[:author].split(' ', 2).first,
      last_name: book[:author].split(' ', 2).last,
      full_name: book[:author]
    }
    [book_details, author_details]
  end

end
