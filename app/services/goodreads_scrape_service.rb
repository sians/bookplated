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

end
