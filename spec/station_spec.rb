require "station"

describe Station do

  it "initializes with @name" do
    station = Station.new("victoria", 1)
    expect(station.name).to eq "victoria"
  end

  it "initializes with @zone" do
    station = Station.new("victoria", 1)
    expect(station.zone).to eq 1
  end

end