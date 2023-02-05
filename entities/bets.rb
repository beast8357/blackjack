class Bets
  def self.operate(player, dealer, game_bank_account, bet_amount)
    player_bet = player.place_bet(bet_amount)
    dealer_bet = dealer.place_bet(bet_amount)
    game_bank_account.take_bet(player, player_bet)
    game_bank_account.take_bet(dealer, dealer_bet)
  end
end
