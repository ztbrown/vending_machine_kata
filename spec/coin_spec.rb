require 'coin'

describe Coin do
  subject {Coin.new({name: 'Penny', weight: 2.5})}
  it 'should respond to weight' do
    expect(subject).to respond_to(:weight)
  end
  it 'should respond to name' do
    expect(subject).to respond_to(:name)
  end
end