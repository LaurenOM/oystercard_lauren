require 'journey'

describe Journey do

  it 'can set an entry station' do
    journey = Journey.new
    journey.set_entry("Moorgate")
    expect(journey.entry_station).to eq("Moorgate")
  end

  it 'can set an exit station' do
    journey = Journey.new
    journey.set_exit("Barbican")
    expect(journey.exit_station).to eq("Barbican")
  end

  it 'can tell if we are currently in journey' do
    journey = Journey.new
    journey.set_entry("Moorgate")
    expect(journey.in_journey?).to eq(true)
  end

  it 'can end a journey' do
    journey = Journey.new
    journey.end_journey
    expect(journey.in_journey?).to be false
  end

  it 'can record full history of a single journey' do
    journey = Journey.new
    journey.set_entry("Moorgate")
    journey.set_exit("Barbican")
    journey.save_journey
    expect(journey.history).to eq([{tap_in_station: "Moorgate", tap_out_station: "Barbican"}])
  end

  it 'has an empty list of journeys by default' do
    expect(subject.history).to eq([])
  end

  it 'can reset journey' do
    journey = Journey.new
    journey.set_entry("Moorgate")
    journey.set_exit("Barbican")
    journey.reset
    expect(journey.in_journey?).to be(false)
  end

  it 'can return a penalty fare' do 
    journey = Journey.new 
    journey.set_exit("Moorgate")
    expect(journey.fare).to eq(6)
  end

end
