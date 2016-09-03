require_relative "../orange"
require_relative "../orange_tree"


describe OrangeTree do

  #You'll need to switch `pending` to `describe` when you're ready
  # to implement each set of tests.
  let(:tree) { OrangeTree.new }

  describe "#age" do
    it "has an age" do
      expect(tree.age).to be_a Fixnum
    end
  end

  describe "#height" do
    it "has a height" do
      expect(tree.height).to be_a Float
    end
  end


  describe "#pass_growing_season" do
    it "should change the age" do
      # This should be more explicit. How much should the tree age by?
      # https://www.relishapp.com/rspec/rspec-expectations/v/2-0/docs/matchers/expect-change
      expect {tree.pass_growing_season}.to change {tree.age}.by(1)
    end

    it "should make the tree grow" do
      #This should be more explicit. How much should the tree grow?
      expect {tree.pass_growing_season}.to change{tree.height}.by(2.5)
    end

    describe "the tree is old enough to bear fruit" do
      it "should cause the tree to produce oranges" do
        6.times { tree.pass_growing_season }
        expect(tree.oranges).to be > 0
      end
    end
  end

  describe "#mature?" do
    it "returns true if tree is old enough to bear fruit" do
      6.times { tree.pass_growing_season }
      expect(tree.mature?).to be true
    end

    it "returns false if tree is not old enough to bear fruit" do
      expect(tree.mature?).to be false
    end
  end

  describe "#dead?" do
    it "should return false for an alive tree" do
      expect(tree.dead?).to be false
    end

    it "should return true for a dead tree" do
      100.times { tree.pass_growing_season }
      expect(tree.dead?).to be true
    end
  end

  describe '#has_oranges?' do
    it 'should return true if oranges are on the tree' do
      7.times { tree.pass_growing_season }
      expect(tree.has_oranges?).to be true
    end

    it "should return false if the tree has no oranges" do
      expect(tree.has_oranges?).to be false
    end
  end

  describe "#pick_an_orange" do
    it "should return an orange from the tree" do
      7.times { tree.pass_growing_season }
      expect(tree.pick_an_orange).to be_an_instance_of(Orange)
    end

    it "the returned orange should no longer be on the tree" do
      7.times { tree.pass_growing_season }
      expect {tree.pick_an_orange}.to change {tree.oranges}.by(-1)
    end

    it "should raise an error if the tree has no oranges" do
      expect{tree.pick_an_orange}.to raise_error('This tree has no oranges')
    end
  end
end
