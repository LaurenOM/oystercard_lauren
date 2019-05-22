class Journey

  attr_reader :entry_station, :exit_station, :history
  MINIMUM = 1
  PENALTY = 6
  def initialize
    @history = []
  end

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

  def save_journey
    @history << { tap_in_station: @entry_station , tap_out_station: @exit_station }
  end

  def reset
    @entry_station = nil
    @exit_station = nil
  end

  def fare 
    if @entry_station == nil || @exit_station == nil
      PENALTY
    else 
      MINIMUM
    end
  end

end
