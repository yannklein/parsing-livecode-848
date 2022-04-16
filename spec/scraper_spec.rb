require_relative "../scraper.rb"

imdb_url = "https://www.imdb.com/chart/top"

# data for #fetch_movies_url:
# [
#   "https://www.imdb.com/title/tt0111161/",
#   "https://www.imdb.com/title/tt0068646/",
#   "https://www.imdb.com/title/tt0071562/",
#   "https://www.imdb.com/title/tt0468569/",
#   "https://www.imdb.com/title/tt0050083/"
# ]

describe "#fetch_movies_url" do
  it "should return an array of 5 movies URLs" do
    actual = fetch_movies_url(imdb_url)
    expected = ["https://www.imdb.com/title/tt0111161/", 
      "https://www.imdb.com/title/tt0068646/", 
      "https://www.imdb.com/title/tt0468569/", 
      "https://www.imdb.com/title/tt0071562/", 
      "https://www.imdb.com/title/tt0050083/"
    ]
    expect(actual).to eq(expected)
  end
end

# data for #scrape_movie:
#
# link to scrape: "https://www.imdb.com/title/tt0468569/"
#
# {
#   cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
#   director: "Christopher Nolan",
#   storyline: "When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham. The Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
#   title: "The Dark Knight",
#   year: 2008
# }

movie_url = "https://www.imdb.com/title/tt0468569/"

describe "#scrape_movie" do
  it "should return a hash with the movie info" do
    actual = scrape_movie(movie_url)
    expected = {
        cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
        director: "Christopher Nolan",
        storyline: "When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham. The Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
        title: "The Dark Knight",
        year: 2008
      }
      expect(actual).to eq(expected)
  end
end