require_relative 'bug_type'

class Firefly < BugType
  BASE_ATTACK_STRENGTH = 45

  CUSTOM_ATTACKS = [:signal_beam, :scissor]

  def attacks
    BUG_TYPE_ATTACKS + CUSTOM_ATTACKS
  end

  def base_attack_strength
    BASE_ATTACK_STRENGTH
  end

end
