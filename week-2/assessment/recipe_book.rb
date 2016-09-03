require 'csv'
require_relative 'recipe'

class RecipeBook

  def initialize(filename)
    @recipes = []
    @file = File.new(filename, "r")
  end

  def find_recipe_by_id(recipe_id)
    recipes_check

    recipe_exists = false
    @recipes.each do | recipe |
      if recipe.id == recipe_id.to_i
        recipe_exists = true
        return pretty_output(recipe)
      end
    end
    raise "Can't find a recipe with an id of #{recipe_id.inspect}" unless recipe_exists
  end

  def alphabetical_recipes
    recipes_check

    sorted_recipes = []
    sort_recipes.each do | recipe |
      sorted_recipes << "#{recipe.id} - #{recipe.name}"
    end
    sorted_recipes
  end

  private

  def parse_recipes_into_instances
    csv = CSV.new(@file, :headers => true, :header_converters => :symbol, :converters => :all)
    csv.to_a.each do | recipe |
      @recipes << Recipe.new(recipe.to_hash)
    end
  end

  def pretty_output(recipe)
    "Recipe #{recipe.id} - #{recipe.name}\n#{recipe.description}\n\nIngredients:\n#{recipe.ingredients}\n\nPreparation Instructions:\n#{recipe.directions}"
  end

  def sort_recipes
    @recipes.sort_by do | recipe |
      recipe.name
    end
  end

  def recipes_check
    parse_recipes_into_instances if @recipes.length == 0
  end

end
