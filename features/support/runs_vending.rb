require 'vending_machine'

module RunsVendingMachine
  attr_reader :vending_machine
  def start_or_reset_vending_machine
    @vending_machine ||= VendingMachine.new()
    @vending_machine.reset
  end

  def set_vending_machine_value(value)
    value = '%.2f' % value.to_f
    @vending_machine.instance_eval("@total = #{value}")
    @vending_machine.instance_variable_get("@display_screen").send(:update, {total: value})
  end

end

World RunsVendingMachine
