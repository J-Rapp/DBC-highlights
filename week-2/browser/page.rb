class Page
  attr_reader :url, :title, :character_count, :links

  def initialize(options = {})
    @url = options[:url]
    @title = options[:heading]
    @character_count = options[:character_count]
    @links = options[:links]
  end

  def pretty_format
    <<-BLOCK

    #{title}
    #{url}

    Content length: #{character_count} characters.

    Links:
    BLOCK
  end

  def pretty_links
    links.each do |array|
      array[0]
      array[1]
    end
  end

end
