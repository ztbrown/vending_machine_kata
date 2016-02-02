require 'display_screen'
require 'observer'
require 'response_codes'

class VendingMachine
  include Observable
  COIN_VALUES = {2.5 => 0, 5 => 0.05, 2.27 => 0.10, 5.67 => 0.25}

  def initialize(args = {}, ui = DisplayScreen)
    @total = 0
    @products = args[:products]
    @display_screen = ui.new(self)
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
      notify({total: @total, response_code: ResponseCodes::VEND})
    else
      notify({total: @total, response_code: ResponseCodes::INSUFFICIENT_FUNDS, product_price: product.price})
    end
  end

  private

  def convert_coin_weight_to_value(coin)
    COIN_VALUES[coin.weight]
  end

  def notify(args)
    changed
    notify_observers(args)
  end

end