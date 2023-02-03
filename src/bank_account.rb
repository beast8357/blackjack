class BankAccount
  attr_reader :money

  def initialize
    @money = 100
  end

  def deduct(amount)
    @money -= amount if money >= 10
  end

  def receive(amount)
    # binding.irb
    @money += amount
  end
end
