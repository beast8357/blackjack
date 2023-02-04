class MoneyManager
  def self.give_winnings(winner, game_bank_account)
    player_bet = game_bank_account.player_bet
    dealer_bet = game_bank_account.dealer_bet
    game_bank_account.transfer(winner.bank_account, player_bet + dealer_bet)
  end

  def self.refund(player, dealer, game_bank_account)
    player_bet = game_bank_account.player_bet
    dealer_bet = game_bank_account.dealer_bet
    game_bank_account.refund_to_player(player.bank_account, player_bet)
    game_bank_account.refund_to_dealer(dealer.bank_account, dealer_bet)
  end
end
