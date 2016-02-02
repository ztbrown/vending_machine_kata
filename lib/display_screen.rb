require 'response_codes'

class DisplayScreen
  attr_reader :display

  def initialize(observable)
    observable.add_observer(self)
    @display = "INSERT COIN"
  end

  def update(args)
    total = args[:total]
    response_code = args[:response_code]
    if (response_code == ResponseCodes::VEND)
      @display = "THANK YOU"
    elsif ((response_code == ResponseCodes::INSUFFICIENT_FUNDS) && (args[:product_price]))
      @display = "PRICE $#{format_price(args[:product_price])}"
    elsif (total == 0)
      reset
    else
      @display = "$#{format_price(total)}"
    end
  end

  private

  def reset
    @display = "INSERT COIN"
  end

  def format_price(price)
    '%.2f' % price
  end

end