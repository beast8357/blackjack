class GameBankAccount
  attr_reader :player_money, :dealer_money

  def initialize
    @player_money = 0
    @dealer_money = 0
  end

  def take_bet(person, amount)
    if person.is_a? Player
      @player_money += amount
    elsif person.is_a? Dealer
      @dealer_money += amount
    end
  end

  def transfer(bank_account, amount)
    bank_account.receive(amount)
    @player_money = 0
    @dealer_money = 0
  end

  def refund_to_player(player_bank_account, player_money)
    player_bank_account.receive(player_money)
    @player_money = 0
  end

  def refund_to_dealer(dealer_bank_account, dealer_money)
    dealer_bank_account.receive(dealer_money)
    @dealer_money = 0
  end
end
