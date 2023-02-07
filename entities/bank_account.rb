# frozen_string_literal: true

class BankAccount
  INITIAL_BALANCE = 100
  MINIMAL_BALANCE = 10

  attr_reader :money

  def initialize
    @money = INITIAL_BALANCE
  end

  def deduct(amount)
    @money -= amount if money >= MINIMAL_BALANCE
    amount
  end

  def receive(amount)
    @money += amount
  end
end
