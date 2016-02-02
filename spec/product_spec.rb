require 'product'

describe Product do
  subject {Product.new({name: 'Name', price: 1.00})}
  it 'should respond to price' do
    expect(subject).to respond_to(:price)
  end
  it 'should respond to name' do
    expect(subject).to respond_to(:name)
  end
end