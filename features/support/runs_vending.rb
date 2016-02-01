require 'vending_machine'

module RunsVendingMachine
  attr_reader :vending_machine
  def start_or_reset_vending_machine
    @vending_machine ||= VendingMachine.new()
    @vending_machine.reset
  end
end

World RunsVendingMachine
