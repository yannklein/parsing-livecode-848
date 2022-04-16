require 'yaml'
require_relative 'scraper'
# get the url to scrape
imdb_url = "https://www.imdb.com/chart/top"
# get the URL of the top 5 movies (scraping) => method
# store into an array (array of strings)
movie_urls = fetch_top_movies

# iterate over the array of URLs
movie_infos = movie_urls.map do |url|
  # for each URL, 
  # scrape the title, description, cast, ... => method
  # store into array of 5 hashes
  scrape_movie(url)
end

# dump this information into a movies.yml
File.open('movies.yml', 'w') do |f|
  f.write(movie_infos.to_yaml)
end