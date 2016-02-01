class VendingMachine
  COIN_VALUES = {2.5 => 0, 5 => 0.05, 2.27 => 0.10, 5.67 => 0.25}

  attr_reader :display, :coins

  def initialize
    reset
    @total = 0
  end

  def reset
    @display = "INSERT COIN"
  end

  def insert_coin(coin)
    @total += convert_coin_weight_to_value(coin)
    update_display(@total)
  end

  private

  def convert_coin_weight_to_value(coin)
    COIN_VALUES[coin.weight]
  end

  def update_display(total)
    if (total == 0)
      reset
    else
      @display = "$#{'%.2f' % total}"
    end
  end

end