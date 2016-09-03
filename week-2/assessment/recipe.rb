class Recipe
  attr_reader :id, :name, :description, :ingredients, :directions

  def initialize(args)
    @id = args.fetch(:id)
    @name = args.fetch(:name)
    @description = args.fetch(:description)
    @ingredients = args.fetch(:ingredients)
    @directions = args.fetch(:directions)
  end

end
