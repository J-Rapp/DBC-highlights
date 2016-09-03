require_relative 'flying_type'
require_relative 'rage_status'

class Bobolink < FlyingType
  include RageStatus

  BASE_ATTACK_STRENGTH = 60
  BASE_DEFENSE_STRENGTH = 30

  CUSTOM_ATTACKS = [:fury_attack, :razor_wind]

  def attacks
    FLYING_TYPE_ATTACKS + CUSTOM_ATTACKS
  end

  def base_attack_strength
    BASE_ATTACK_STRENGTH
  end

  def base_defense_strength
    BASE_DEFENSE_STRENGTH
  end

end
