class Bank
  attr_accessor :money

  def initialize
    @money = 100
  end

  def deduct
    self.money -= 10 if money >= 10
  end

  def receive(amount)
    self.money += amount
  end
end
