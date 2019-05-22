class Journey

  attr_reader :entry_station, :exit_station, :history
  MINIMUM = 1
  PENALTY = 6

  def set_entry(station)
    @entry_station = station
  end

  def set_exit(station)
    @exit_station = station
  end

  def in_journey?
    @entry_station != nil
  end

  def end_journey
    @entry_station = nil
  end

  def return_journey
    { entry_station: @entry_station , exit_station: @exit_station }
  end

  def reset
    @entry_station = nil
    @exit_station = nil
  end

  def is_complete?
    @entry_station != nil && @exit_station != nil
  end

  def fare 
    if is_complete?
      MINIMUM
    else 
      PENALTY
    end
  end

end
