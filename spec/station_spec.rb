require 'station'

describe Station do

  it 'exposes a name variable' do
    station = Station.new("Barbican",1)
    expect(station.name).to eq("Barbican")
  end

  it 'exposes a zone variable' do
    station = Station.new("Barbican",1)
    expect(station.zone).to eq(1)
  end

end
