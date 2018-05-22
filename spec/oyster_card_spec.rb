require 'oyster_card'

describe OysterCard do

  let(:station){ double :station }

  it "has a balance of zero" do
    expect(subject.balance).to eq 0
  end

  context '#top_up' do

    it 'tops up card' do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end

    it 'limits top up' do
      subject.top_up(OysterCard::DEFAULT_MAX_LIMIT)
      message = "Failed: exceeded max balance #{OysterCard::DEFAULT_MAX_LIMIT}"
      expect { subject.top_up(1) } .to raise_error message
    end
  end

  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end

  it 'can touch in' do
    subject.top_up(OysterCard::MINIMUM_AMOUNT)
    subject.touch_in(station)
    expect(subject).to be_in_journey
  end

  # let(:station){ double :station }

  it 'stores the entry station' do
    subject.top_up(OysterCard::MINIMUM_AMOUNT)
    subject.touch_in(station)
    expect(subject.entry_station).to eq station
  end

  it 'raise error if touch in with less than minimum amount' do
    message = "Cannot touch in, less than #{OysterCard::MINIMUM_AMOUNT} pound on card"
    expect { subject.touch_in(station) }.to raise_error message
  end

  it 'can touch out' do
    subject.top_up(OysterCard::MINIMUM_AMOUNT)
    subject.touch_in(station)
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it 'charges minimum amount when touch out' do
    subject.top_up(OysterCard::MINIMUM_AMOUNT)
    subject.touch_in(station)
    expect{ subject.touch_out }.to change{ subject.balance }.by(-OysterCard::MINIMUM_AMOUNT)
  end
end
