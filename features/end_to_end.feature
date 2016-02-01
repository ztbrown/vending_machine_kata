Feature: End to end test

  Scenario:As a vendor
  I want a vending machine that accepts valid coins (nickels, dimes and quarters) and rejects invalids ones (pennies)
  So that I can collect money from the customer

    Given a vending machine is awaiting coins
    Then the display should read INSERT COIN
    When a customer inserts a penny, nickel, dime and quarter
    Then the display should read $0.40