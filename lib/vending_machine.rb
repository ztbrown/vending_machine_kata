class VendingMachine
  COIN_VALUES = {2.5 => 0, 5 => 0.05, 2.27 => 0.10, 5.67 => 0.25}

  attr_reader :display, :coins

  def initialize
    @display = "INSERT COIN"
    @total = 0
  end

  def reset

  end

  def insert_coin(coin)
    @total += convert_coin_weight_to_value(coin)
  end

  private

  def convert_coin_weight_to_value(coin)
    COIN_VALUES[coin.weight]
  end

end