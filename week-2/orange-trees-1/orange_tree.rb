class OrangeTree
attr_reader :age, :height, :oranges
  def initialize
    @height = 0.0
    @age = 0
    @oranges = 0
  end
  # Define a custom exception class
  class NoOrangesError < StandardError

  end

  def pass_growing_season
    #drop unharvested oranges
    @age += 1
    @height += 2.5 unless @height == 25
    if mature?
      @oranges += rand(100..300)
    end
  end

  def dead?
    if @age >= 100
      true
    else
      false
    end
  end

  # Returns true if the tree is old enough to bear fruit (6), false otherwise
  def mature?
    if @age > 5
      true
    else
      false
    end
  end

  # Returns +true+ if there are any oranges on the tree, +false+ otherwise
  def has_oranges?
    if @oranges > 0
      true
    else
      false
    end
  end

  # Returns an Orange if there are any
  # Raises a NoOrangesError otherwise
  def pick_an_orange
    raise NoOrangesError, "This tree has no oranges" unless self.has_oranges?
    @oranges -= 1
    Orange.new
  end
end
