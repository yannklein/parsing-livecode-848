require "open-uri"
require "nokogiri"

def fetch_movies_url(imdb_url)
  # initialize empty array
  movie_urls = []
  # open and read the url, gives us html string
  html_serialized = URI.open(imdb_url).read
  # parse the html with nokogiri, gives us a Nokogiri::HTML object
  doc = Nokogiri::HTML(html_serialized)
  # search for the 5 first items
  doc.search(".titleColumn").first(5).each do |movie_item|
    # search for the href of each of them (string)
    movie_url = movie_item.search("a").attribute("href").value
    movie_urls << "https://www.imdb.com#{movie_url}"
    # store them in the empty array
  end
  # and return array
  movie_urls
end


def scrape_movie(url)
  # open and read the url, gives us html string
  html_serialized = URI.open(url).read
  # parse the html with nokogiri, gives us a Nokogiri::HTML object
  doc = Nokogiri::HTML(html_serialized)
  # search for the 5 first items
  title = doc.search('.sc-b73cd867-0.eKrKux').text.strip
  storyline = doc.search(".ipc-html-content--base").text.strip
  year = doc.search('.sc-8c396aa2-2').text.strip
  cast = doc.search('.sc-11eed019-7').first(3).map do |cast_item|
    cast_item.search(".sc-11eed019-1").text.strip
  end
  director = doc.search('.ipc-metadata-list-item__list-content-item')[0].text.strip
  return {
    title: title,
    storyline: storyline,
    year: year,
    cast: cast,
    director: director
  }
end
