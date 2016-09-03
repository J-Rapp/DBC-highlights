require_relative '../post'

describe Post do
  let(:post) { Post.new({url: "www.google.com", author_username: "Stupid", title: "A thing", points: 384, post_id: 5003980}) }

  context 'Initialize' do
    let(:incomplete_args) { {title: "A thing", author_username: "Stupid", points: 384, post_id: 5003980} }

    it 'exists' do
      expect(post).to be_instance_of Post
    end

    it 'has readable attributes' do
      expect(post.url).to eq "www.google.com"
    end

    it 'raises an error if initialize is missing arguments' do
      expect{ Post.new(incomplete_args) }.to raise_error(ArgumentError)
    end
  end

  context 'Comment methods' do
    xit 'adds a comment' do
      expect{ post.add_comment }.to change (post.comments).by 1
    end

    xit 'returns the post\'s collection of comments' do
      expect(post.comments).to
    end
  end

end
