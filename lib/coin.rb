class Coin
  attr_reader :name, :weight
  def initialize(args)
    @name = args[:name]
    @weight = args[:weight]
  end
end