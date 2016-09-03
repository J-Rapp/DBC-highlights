require_relative 'flying_type'
require_relative 'rage_status'

class Nighthawk < FlyingType
  include RageStatus

  BASE_ATTACK_STRENGTH = 45
  BASE_DEFENSE_STRENGTH = 40

  CUSTOM_ATTACKS = [:peck, :hurricane]

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
