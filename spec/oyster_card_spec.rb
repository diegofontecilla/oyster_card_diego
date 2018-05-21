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
      max = Oystercard::DEFAULT_MAX_LIMIT
      subject.top_up(max)
      message = "Failed: exceeded max balance #{max}"
      expect { subject.top_up(1) } .to raise_error message
    end

  end
end
