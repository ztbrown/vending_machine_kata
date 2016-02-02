require 'vending_machine'
require 'product'

module RunsVendingMachine
  attr_reader :vending_machine
  def start_or_reset_vending_machine
    @vending_machine ||= VendingMachine.new({ products: [Product.new({name: 'Cola', price: 1.00}),
                                              Product.new({name: 'Chips', price: 0.50}),
                                              Product.new({name: 'Candy', price: 0.65})]})
    @vending_machine.reset
  end

  def set_vending_machine_value(value)
    value = '%.2f' % value.to_f
    @vending_machine.instance_eval("@total = #{value}")
    @vending_machine.instance_variable_get("@display_screen").send(:update, {total: value})
  end

end

World RunsVendingMachine
