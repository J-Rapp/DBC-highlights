require_relative 'mascot'

class BugType < Mascot
  BASE_HIT_POINTS = 60
  BASE_DEFENSE_STRENGTH = 50

  ATTACK_TYPES_BUG_TYPES_SUSCEPTIBLE_TO = [:water]
  ATTACK_TYPES_BUG_TYPES_RESISTANT_TO = [:flying]
  ATTACK_TYPES_BUG_TYPES_IMMUNE_TO = [:ground]

  BUG_TYPE_ATTACKS = [:bug_bite, :buzz]

  def base_hit_point_value
    BASE_HIT_POINTS
  end


  def base_defense_strength
    BASE_DEFENSE_STRENGTH
  end


  def immune_to?(attack_type)
    ATTACK_TYPES_BUG_TYPES_IMMUNE_TO.include?(attack_type)
  end

  def resistant_to?(attack_type)
    ATTACK_TYPES_BUG_TYPES_RESISTANT_TO.include?(attack_type)
  end

  def susceptible_to?(attack_type)
    ATTACK_TYPES_BUG_TYPES_SUSCEPTIBLE_TO.include?(attack_type)
  end

  def type
    :bug
  end

end
