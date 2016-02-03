class Coin
  attr_reader :name, :weight, :price
  def initialize(args)
    @name = args[:name]
    @weight = args[:weight]
    @price = args[:price]
  end
end