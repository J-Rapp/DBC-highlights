require_relative 'mascot'

class WaterType < Mascot
  BASE_ATTACK_STRENGTH = 45

  ATTACK_TYPES_WATER_TYPES_SUSCEPTIBLE_TO = [:water]
  ATTACK_TYPES_WATER_TYPES_RESISTANT_TO = [:ground]
  ATTACK_TYPES_WATER_TYPES_IMMUNE_TO = [:flying]

  WATER_TYPE_ATTACKS = [:water_pulse, :bubble_beam]

  def base_hit_point_value
    BASE_HIT_POINTS
  end

  def base_attack_strength
    BASE_ATTACK_STRENGTH
  end

  def immune_to?(attack_type)
    ATTACK_TYPES_WATER_TYPES_IMMUNE_TO.include?(attack_type)
  end

  def resistant_to?(attack_type)
    ATTACK_TYPES_WATER_TYPES_RESISTANT_TO.include?(attack_type)
  end

  def susceptible_to?(attack_type)
    ATTACK_TYPES_WATER_TYPES_SUSCEPTIBLE_TO.include?(attack_type)
  end

  def type
    :water
  end

end
