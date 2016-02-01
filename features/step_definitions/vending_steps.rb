Given "a vending machine is awaiting coins" do
  start_or_reset_vending_machine
end

Then /^the display should read (.*)$/ do |arg|
  expect(vending_machine.display).to eq(arg)
end

When "a customer inserts a penny, nickel, dime and quarter" do
  vending_machine.insert_coin(Coin.new({name: 'Nickel', weight: 5}))
  vending_machine.insert_coin(Coin.new({name: 'Dime', weight: 2.27}))
  vending_machine.insert_coin(Coin.new({name: 'Quarter', weight: 5.67}))
  vending_machine.insert_coin(Coin.new({name: 'Penny', weight: 2.5}))
end

