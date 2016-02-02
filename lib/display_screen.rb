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
    elsif (total == 0)
      reset
    else
      @display = "$#{'%.2f' % total}"
    end
  end

  private

  def reset
    @display = "INSERT COIN"
  end

end