# frozen_string_literal: true

class GameBankAccount
  attr_reader :player_bet, :dealer_bet

  def initialize
    @player_bet = 0
    @dealer_bet = 0
  end

  def take_bet(person, bet_amount)
    if person.is_a? Player
      @player_bet += bet_amount
    elsif person.is_a? Dealer
      @dealer_bet += bet_amount
    end
  end

  def transfer(bank_account, amount)
    bank_account.receive(amount)
    @player_bet = 0
    @dealer_bet = 0
  end

  def refund_to_player(player_bank_account, player_bet)
    player_bank_account.receive(player_bet)
    @player_bet = 0
  end

  def refund_to_dealer(dealer_bank_account, dealer_bet)
    dealer_bank_account.receive(dealer_bet)
    @dealer_bet = 0
  end
end
