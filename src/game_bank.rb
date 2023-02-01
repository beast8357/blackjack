class GameBank
  attr_accessor :deposit

  def initialize
    @deposit = 0
  end

  def take_bet
    self.deposit += 10
  end

  def transfer(player)
    player.bank_account.receive(deposit)
    self.deposit = 0
  end
end
