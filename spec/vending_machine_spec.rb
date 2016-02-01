require 'vending_machine'

describe VendingMachine do

  context 'when no coins have been inserted' do
    subject { VendingMachine.new.display }
    it { is_expected.to eq("INSERT COIN") }
  end

  context 'when a penny has been inserted' do
    subject {VendingMachine.new}
    before(:each) do
      @coin = instance_double("Coin", :name => 'Penny', :weight => 2.5)
      subject.insert_coin(@coin)
    end
    it 'is expected to equal "INSERT COIN"' do
      expect(@coin).to have_received(:weight).exactly(1).times
      expect(subject.display).to eq("INSERT COIN")
    end
  end

  context 'when a nickel has been inserted' do
    subject {VendingMachine.new}
    before(:each) do
      @coin = instance_double("Coin", :name => 'Nickel', :weight => 5)
      subject.insert_coin(@coin)
    end
    it 'is expected to equal "$0.05"' do
      expect(@coin).to have_received(:weight).exactly(1).times
      expect(subject.display).to eq("$0.05")
    end
  end

  context 'when a dime has been inserted' do
    subject {VendingMachine.new}
    before(:each) do
      @coin = instance_double("Coin", :name => 'Dime', :weight => 2.27)
      subject.insert_coin(@coin)
    end
    it 'is expected to equal "$0.10"' do
      expect(@coin).to have_received(:weight).exactly(1).times
      expect(subject.display).to eq("$0.10")
    end
  end

end