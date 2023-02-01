class Bank
  attr_accessor :deposit

  def initialize
    @deposit = 100
  end

  def deduct
    self.deposit -= 10 if deposit >= 10
  end

  def receive(money)
    self.deposit += money
  end
end
