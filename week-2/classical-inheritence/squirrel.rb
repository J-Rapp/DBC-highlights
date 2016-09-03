require_relative 'ground_type'
require_relative 'levitating_status'

class Squirrel < GroundType
  include LevitatingStatus

  BASE_ATTACK_STRENGTH = 50
  BASE_DEFENSE_STRENGTH = 95

  CUSTOM_ATTACKS = [:tail_whip, :thrash]

  def attacks
    GROUND_TYPE_ATTACKS + CUSTOM_ATTACKS
  end

  def base_attack_strength
    BASE_ATTACK_STRENGTH
  end

  def base_defense_strength
    BASE_DEFENSE_STRENGTH
  end

 end
