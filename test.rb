require 'open-uri'
require 'nokogiri'

url = 'https://www.imdb.com/title/tt0468569/'
html_content = URI.open(url, 'Accept-Language' => 'en-US').read
doc = Nokogiri::HTML(html_content)

cast = doc.search('.sc-11eed019-7').first(3).map do |cast_item|
  cast_item.search(".sc-11eed019-1").text.strip
end
p cast

# OR (if you need to iterate over multiple elements)
# doc.search('.REPLACE_ME').each do |element|
  # element.text.strip
# end