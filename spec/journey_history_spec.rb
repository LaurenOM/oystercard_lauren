require 'journey_history'

describe JourneyHistory do
  let(:journey) {double (:journey)}

  it 'has an empty list of journeys by default' do
    journey_history = JourneyHistory.new
    expect(journey_history.history).to eq([])
  end

  it 'can record full history of a single journey' do
    allow(journey).to receive(:return_journey).and_return({entry_station: "Moorgate", exit_station: "Barbican"})
    journey_history = JourneyHistory.new(journey)
    journey_history.save_journey
    expect(journey_history.history).to include({entry_station: "Moorgate", exit_station: "Barbican"})
  end
end
