require 'display_screen'
require 'coin'
require 'observer'
require 'response_codes'

class VendingMachine
  include Observable
  attr_reader :coin_return
  COIN_VALUES = {2.5 => 0, 5 => 0.05, 2.27 => 0.10, 5.67 => 0.25}

  def initialize(args = {}, ui_class = DisplayScreen)
    @total = 0
    @products = args[:products]
    @display_screen = ui_class.new(self)
    reset
  end

  def reset
    @total = 0
    notify({total: @total})
  end

  def insert_coin(coin)
    notify({total: @total += convert_coin_weight_to_value(coin)})
  end

  def display
    @display_screen.display
  end

  def press_button_for(product_name)
    product = @products.find {|p| p.name == product_name}
    if @total >= product.price
      @total = @total - product.price
      make_change(@total)
      notify({total: @total, response_code: ResponseCodes::VEND})
    else
      notify({total: @total, response_code: ResponseCodes::INSUFFICIENT_FUNDS, product_price: product.price})
    end
  end

  private

  def convert_coin_weight_to_value(coin)
    COIN_VALUES[coin.weight]
  end

  def make_change(total)
    @coin_return = []

    (total / 0.25).floor.times do
      total = (total - 0.25).round(2)
      @coin_return << Coin.new({name: 'Quarter', weight: '5.67', price: 0.25})
    end

    (total / 0.10).floor.times do
      total = (total - 0.10).round(2)
      @coin_return << Coin.new({name: 'Dime', weight: '2.27', price: 0.10})
    end

    (total / 0.05).floor.times do
      total = (total - 0.05).round(2)
      @coin_return << Coin.new({name: 'Nickel', weight: '5', price: 0.05})
    end
    @total = total
  end

  def notify(args)
    changed
    notify_observers(args)
  end

end