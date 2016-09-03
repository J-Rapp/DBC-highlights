require_relative 'recipe_book'


if ARGV.any?
  recipe_book = RecipeBook.new('recipes.csv')

  if ARGV[0] == "list"
    puts recipe_book.alphabetical_recipes
  elsif ARGV[0] == "display"
    puts recipe_book.find_recipe_by_id(ARGV[1])
  end
end
