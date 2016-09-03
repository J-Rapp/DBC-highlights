require 'nokogiri'

require_relative 'html_whitespace_cleaner'
require_relative 'post'
require_relative 'comment'

class PageParser
  attr_reader :nokogiri_doc

  def initialize(html_file)
    @nokogiri_doc = create_nokogiri_doc(html_file)
  end

  def create_nokogiri_doc(html_file)
    open_file = File.read(html_file)
    clean_html = HTMLWhitespaceCleaner.clean(open_file)
    nokogiri_doc = Nokogiri.parse(clean_html)
  end

  def create_post_args
    # input - a bunch of nokogiri grabs
    hash = {
      title: grab_post_title,
      url: grab_post_url,
      author_username: grab_post_author_username,
      points: grab_post_points,
      post_id: grab_post_post_id
    }
    # output a hash of (post)title, url, author_username, points, post_id
  end

  def gather_comments
    hash_pairs = []

    users = grab_all_comment_users
    contents = grab_all_comment_contents

    users.length.times do |i|
    hash_pairs << Hash[comment_author: users[i], content: contents[i]]
    end

    hash_pairs
  end

  def grab_all_comment_users
    array = @nokogiri_doc.css('.comhead > a').map do | span |
      span.inner_text
    end
    array = array.reject do |username|
      username.include?('.com')
    end
    array # of username strings
  end

  def grab_all_comment_contents
    array = @nokogiri_doc.css('.c00').map do | span |
      span.inner_text
    end
    array # of comment strings
  end

  def grab_post_title
    @nokogiri_doc.css('.title > a').first.inner_text
  end

  def grab_post_url
    @nokogiri_doc.css('.title > a').first['href']
  end

  def grab_post_author_username
    @nokogiri_doc.css('.subtext > a').first.inner_text
  end

  def grab_post_points
    @nokogiri_doc.css('.subtext > span:first-child').first.inner_text.slice(/\A\d*/).to_i
  end

  def grab_post_post_id
    @nokogiri_doc.css('.subtext > span:first-child').first.attributes["id"].value.slice(/\d*\z/).to_i
  end

end




