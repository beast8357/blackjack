class MoneyManager
  def self.give_winnings(winner, game_bank_account)
    player_money = game_bank_account.player_money
    dealer_money = game_bank_account.dealer_money
    game_bank_account.transfer(winner.bank_account, player_money + dealer_money)
  end

  def self.refund(player, dealer, game_bank_account)
    player_money = game_bank_account.player_money
    dealer_money = game_bank_account.dealer_money
    game_bank_account.refund_to_player(player.bank_account, player_money)
    game_bank_account.refund_to_dealer(dealer.bank_account, dealer_money)
  end
end
