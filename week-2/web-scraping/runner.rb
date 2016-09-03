# The provided files will be loaded when this file executes.
# Require any additional files that have been created.
require_relative 'page_parser'
require_relative 'post'
require_relative 'comment'

require 'open-uri'



def parse_page(html_file)
  PageParser.new(html_file)
end

def create_post(page)
  Post.new(page.create_post_args)
end

def create_all_comments(page)
  page.gather_comments.each do | pair_hash |
    Comment.new(pair_hash)
  end
end

def display(post)
  output = "\n"
  output += post.title + " (Hacker News ID: #{post.post_id})" + "\n"
  output += "URL: " + post.url + "\n"
  output += "Author: " + post.author_username + "\n"
  output += "Points: " + post.points.to_s + "\n"
  output += "\nComments:\n"
  post.comments.each do |comment|
    output += "\"#{comment[:content]}\"" + "\n- " + comment[:comment_author] + "\n\n"
  end
  output
end


html_file = open("#{ARGV[0]}")
page = parse_page(html_file)
post = create_post(page)
create_all_comments(page).each do |comment_instance|
      post.add_comment(comment_instance)
end
puts display(post)
