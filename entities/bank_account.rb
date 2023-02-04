class BankAccount
  attr_reader :money

  def initialize
    @money = 100
  end

  def deduct(amount)
    @money -= amount if money >= 10
    amount
  end

  def receive(amount)
    @money += amount
  end
end
