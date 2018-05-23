require "journey"

describe Journey do

  let(:fake_victoria) { double :station, zone: 1 }
  let(:fake_clapham) { double :station, zone: 3 }

  it "responds to entry_station method" do
    journey = Journey.new(fake_victoria, nil)
    expect(journey.entry_station).to eq fake_victoria
  end

  it "responds to exit_station method" do
    journey = Journey.new(nil, fake_clapham)
    expect(journey.exit_station).to eq fake_clapham
  end

end