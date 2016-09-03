module LevitatingStatus

  def levitate
    @status = :levitating
  end

  def reset_status
    @status = :normal
  end

end
