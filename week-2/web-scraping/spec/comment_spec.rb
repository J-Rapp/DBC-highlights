require_relative '../comment'

describe Comment do
  context 'Initialize' do
    args = {
      comment_author: "Jake",
      content: "I smell bad"
    }
    incomplete_args = {
      content: "There is nothing here..."
    }

    it 'has readable attributes' do
      expect(Comment.new(args)).to be_instance_of Comment
    end

    it 'raises an error if an argument is missing' do
      expect{ Comment.new(incomplete_args) }.to raise_error ArgumentError
    end
  end

end
