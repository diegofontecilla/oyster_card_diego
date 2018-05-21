require 'oyster_card'

describe Oystercard do

  it "has a balance of zero" do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do

    it 'tops up card' do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end

    it 'limits top up' do
      message = "Card top up failed: exceeded maximum balance"
      expect { subject.top_up(95) } .to raise_error message
    end

  end
end
