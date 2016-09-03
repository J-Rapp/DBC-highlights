require_relative 'bug_type'

class Dragonfly < BugType
  BASE_ATTACK_STRENGTH = 55

  CUSTOM_ATTACKS = [:silver_wind, :pin_missile]

  def attacks
    BUG_TYPE_ATTACKS + CUSTOM_ATTACKS
  end

  def base_attack_strength
    BASE_ATTACK_STRENGTH
  end

end
