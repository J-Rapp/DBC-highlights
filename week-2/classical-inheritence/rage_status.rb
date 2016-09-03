module RageStatus

  def rage
    @status = :rage
  end

  def reset_status
    @status = :normal
  end

end
