require 'oyster_card'

describe OysterCard do

  # it { is_expected.to respond_to(:deduct).with(1).argument }

  it "has a balance of zero" do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do

    it 'tops up card' do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end

    it 'limits top up' do
      max = OysterCard::DEFAULT_MAX_LIMIT
      subject.top_up(max)
      message = "Failed: exceeded max balance #{max}"
      expect { subject.top_up(1) } .to raise_error message
    end

    describe '#deduct' do
      it 'amount on card' do
        subject.top_up(30)
        expect{ subject.deduct 3 }.to change{ subject.balance }.by -3
      end
    end
  end
end
