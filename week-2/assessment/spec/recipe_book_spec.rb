require_relative "../recipe_book"

describe RecipeBook do
  let(:recipe_book) { RecipeBook.new('recipes.csv') }

  describe "#find_recipe_by_id" do
    it 'finds a recipe by id' do
      expect(recipe_book.find_recipe_by_id(111)).to be_a String
    end

    it "raises an exception if it can't find a recipe" do
      expect { recipe_book.find_recipe_by_id(999) }.to raise_error RuntimeError
    end
  end
end
