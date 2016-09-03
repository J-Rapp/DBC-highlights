class Post
  attr_reader :title, :url, :author_username, :points, :post_id, :comments

  def initialize(args)
    @title = args.fetch(:title){ raise ArgumentError.new("New Comment instance does not have correct info") }
    @url = args.fetch(:url){ raise ArgumentError.new("New Comment instance does not have correct info") }
    @author_username = args.fetch(:author_username){ raise ArgumentError.new("New Comment instance does not have correct info") }
    @points = args.fetch(:points){ raise ArgumentError.new("New Comment instance does not have correct info") }
    @post_id = args.fetch(:post_id){ raise ArgumentError.new("New Comment instance does not have correct info") }
    @comments = []
  end

  def add_comment(comment_instance)
    @comments << comment_instance
  end

end
