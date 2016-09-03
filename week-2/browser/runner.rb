require 'net/http'
require 'nokogiri'

require_relative 'page'

# Prompt user for input
# prompt_user_for_input
# Get user input
# user_input = get_user_input

puts "What website URL would you like to display?"
user_input = gets.chomp

# Download raw page from URL
#raw_page = download_raw_page_from_url(user_input)

uri = URI.parse(user_input)
raw_page = Net::HTTP.get(uri)

# Parse raw page into Nokogiri document
nokogiri_document = Nokogiri.parse(raw_page) #parse_raw_page_into_nokogiri_document(raw_page)



 # heading from nokogiri document
 title = nokogiri_document.css('.pg-headline').text

 # character count from nokogiri document
 character_count = nokogiri_document.css('.zn-body__paragraph').text.chars.length


 # collection of links from nokogiri document
 collection_of_links = nokogiri_document.css('.zn-body__read-all a[@href]').map do | link |
                          [link.text.strip, link["href"]]
                       end

 # create a page with variables from Nokogiri document

 page = Page.new(url: user_input, heading: title, character_count: character_count, links: collection_of_links)


# # Format page for display
# formatted_page = format_page_for_display(page)

 puts page.pretty_format
 puts page.pretty_links


