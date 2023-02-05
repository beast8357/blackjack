require_relative 'player_stats'
require_relative 'dealer_stats'
require_relative 'judge'
require_relative 'results'
require_relative 'money_manager'

class Finalizer
  def self.finalize(player, dealer, game_bank_account)
    puts "Preparing results..."
    sleep(1.5)
    winner = Judge.judge(player, dealer)
    Results.message(winner)
    PlayerStats.show(player)
    DealerStats.show(dealer)
    winner.nil? ? MoneyManager.refund(player, dealer, game_bank_account) :
                  MoneyManager.give_winnings(winner, game_bank_account)
  end
end
