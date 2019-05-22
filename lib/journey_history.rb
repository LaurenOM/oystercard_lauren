class JourneyHistory
  attr_reader :journey_class, :entry_station, :history

  def initialize(journey_class = Journey.new)
    @journey_class = journey_class
    @history = []
  end

  def start_journey(station)
    journey.set_entry(station)
  end

  def save_journey
    @history.push(journey_class.return_journey)
  end 

end
