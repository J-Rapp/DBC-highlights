require_relative 'water_type'
require_relative 'rage_status'
require_relative 'levitating_status'

class Otter < WaterType
  include RageStatus
  include LevitatingStatus

  BASE_HIT_POINTS = 60
  BASE_DEFENSE_STRENGTH = 70

  CUSTOM_ATTACKS = [:aqua_tail, :water_spout]

  def attacks
    WATER_TYPE_ATTACKS + CUSTOM_ATTACKS
  end

  def base_defense_strength
    BASE_DEFENSE_STRENGTH
  end

  def base_hit_point_value
    BASE_HIT_POINTS
  end

end
