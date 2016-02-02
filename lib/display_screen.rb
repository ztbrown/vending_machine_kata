require 'response_codes'

class DisplayScreen

  def initialize(observable)
    observable.add_observer(self)
    @display = "INSERT COIN"
  end

  def update(args)
    total = args[:total]
    response_code = args[:response_code]
    if (response_code == ResponseCodes::VEND)
      @temp_display = "THANK YOU"
    elsif ((response_code == ResponseCodes::INSUFFICIENT_FUNDS) && (args[:product_price]))
      @temp_display = "PRICE $#{format_price(args[:product_price])}"
    end

    if (total == 0)
      reset
    else
      @display = "$#{format_price(total)}"
    end
  end

  def display
    if temp = temp_display
      temp
    else
      @display
    end
  end

  private

  def reset
    @display = "INSERT COIN"
  end

  def format_price(price)
    '%.2f' % price
  end

  def temp_display
    temp = @temp_display
    @temp_display = nil
    temp
  end

end