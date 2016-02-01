require 'vending_machine'

describe VendingMachine do

  context 'when no coins have been inserted' do
    subject { VendingMachine.new.display }
    it { is_expected.to eq("INSERT COIN") }
  end

end