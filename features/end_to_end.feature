Feature: End to end test

  Background:
    Given a vending machine is awaiting coins
    Then the display should read INSERT COIN

  #As a vendor
  #I want a vending machine that accepts coins
  #So that I can collect money from the customer

  #The vending machine will accept valid coins (nickels, dimes, and quarters) and reject invalid ones (pennies).
  #When a valid coin is inserted the amount of the coin will be added to the current amount and the display will be updated.
  #When there are no coins inserted, the machine displays INSERT COIN. Rejected coins are placed in the coin return.

  #NOTE: The temptation here will be to create Coin objects that know their value. However, this is not how a real vending machine works.
  #Instead, it identifies coins by their weight and size and then assigned a value to what was inserted. You will need to do something similar.
  #This can be simulated using strings, constants, enums, symbols, or something of that nature.

  Scenario: Place each kind of denomination into vending machine, read display
    When a customer inserts a penny, nickel, dime and quarter
    Then the display should read $0.40

  #As a vendor
  #I want customers to select products
  #So that I can give them an incentive to put money in the machine

  #There are three products: cola for $1.00, chips for $0.50, and candy for $0.65.
  #When the respective button is pressed and enough money has been inserted, the product is dispensed and the machine displays THANK YOU.
  #If the display is checked again, it will display INSERT COINS and the current amount will be set to $0.00.
  #If there is not enough money inserted then the machine displays PRICE and the price of the item and subsequent checks
  #of the display will display either INSERT COINS or the current amount as appropriate.

  Scenario: Place $1.00 in vending machine and push button for cola, read display
    When a customer inserts "1.00"
    When a customer presses the Cola button
    Then the display should read THANK YOU
    Then the display should read INSERT COIN

  Scenario: Place $0.50 in vending machine and push button for chips, read display
    When a customer inserts "0.50"
    When a customer presses the Chips button
    Then the display should read THANK YOU
    Then the display should read INSERT COIN

  Scenario: Place $0.65 in vending machine and push button for candy, read display
    When a customer inserts "0.65"
    When a customer presses the Candy button
    Then the display should read THANK YOU
    Then the display should read INSERT COIN

  Scenario: Place $1.25 in vending machine and push button for cola, read display
    When a customer inserts "1.25"
    When a customer presses the Cola button
    Then the display should read THANK YOU
    Then the display should read INSERT COIN

  Scenario: Place $0.25 in vending machine and push button for cola, read display
    When a customer inserts "0.25"
    When a customer presses the Cola button
    Then the display should read PRICE $1.00
    Then the display should read $0.25

