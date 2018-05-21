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
  end
end
