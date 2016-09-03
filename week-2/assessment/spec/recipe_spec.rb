require_relative "../recipe"

describe Recipe do
  hash = {
    id:111,
    name: "Kale Burger",
    description: "Combining the taste of cow with the nutrition of kale!",
    ingredients: "Kale, Cow",
    directions: "Preheat oven to 500 degrees, put in a cow. Wait 10 minutes. Put in some kale. Take out cow and kale. Put on bun. Serve HOT!"
  }
  let(:recipe) { Recipe.new(hash) }

  it 'has readable attributes' do
    expect(recipe.name).to eq "Kale Burger"
  end

end
