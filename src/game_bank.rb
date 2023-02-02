class GameBank
  attr_accessor :money

  def initialize
    @money = 0
  end

  def take_bet
    self.money += 10
  end

  def transfer(player, amount)
    player.bank_account.receive(amount)
  end

  def clear
    self.money = 0
  end
end
