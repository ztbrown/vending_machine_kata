require 'vending_machine'

describe VendingMachine do

  describe 'inserting coins' do

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

    context 'when a quarter has been inserted' do
      subject {VendingMachine.new}
      before(:each) do
        @coin = instance_double("Coin", :name => 'Quarter', :weight => 5.67)
        subject.insert_coin(@coin)
      end
      it 'is expected to equal "$0.25"' do
        expect(@coin).to have_received(:weight).exactly(1).times
        expect(subject.display).to eq("$0.25")
      end
    end
  end

  describe 'vending products' do

    context 'when no coins have been inserted' do
      subject { VendingMachine.new({products: [instance_double("Product", :name => 'Cola', :price => 1.00),
                                               instance_double("Product", :name => 'Chips', :price => 0.50),
                                               instance_double("Product", :name => 'Candy', :price => 0.65)]}) }
      it 'should display \'PRICE $1.00\' when cola is selected' do
        subject.press_button_for('Cola')
        expect(subject.display).to eq("PRICE $1.00")
      end

      it 'should display \'PRICE $0.65\' when candy is selected' do
        subject.press_button_for('Candy')
        expect(subject.display).to eq("PRICE $0.65")
      end

      it 'should display \'PRICE $0.50\' when chips is selected' do
        subject.press_button_for('Chips')
        expect(subject.display).to eq("PRICE $0.50")
      end

    end


    context 'when the correct amount of money has been inserted' do
      subject { VendingMachine.new({ products: [instance_double("Product", :name => 'Cola', :price => 1.00),
                                    instance_double("Product", :name => 'Chips', :price => 0.50),
                                    instance_double("Product", :name => 'Candy', :price => 0.65)]}) }

      before(:each) do
        coin = instance_double("Coin", :name => 'Quarter', :weight => 5.67)
        4.times { subject.insert_coin(coin) }
      end

      it 'should display THANK YOU when cola is selected' do
        subject.press_button_for('Cola')
        expect(subject.display).to eq("THANK YOU")
      end

      it 'should display THANK YOU when candy is selected' do
        subject.press_button_for('Candy')
        expect(subject.display).to eq("THANK YOU")
      end

      it 'should display THANK YOU when chips is selected' do
        subject.press_button_for('Chips')
        expect(subject.display).to eq("THANK YOU")
      end
    end
  end

end