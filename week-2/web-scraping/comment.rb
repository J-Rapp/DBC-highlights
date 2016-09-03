class Comment
  attr_reader :comment_author, :content

  def initialize(args)
    @comment_author = args.fetch(:comment_author){ raise ArgumentError.new("New Comment instance does not have correct info") }
    @content = args.fetch(:content){ raise ArgumentError.new("New Comment instance does not have correct info") }
  end

end
