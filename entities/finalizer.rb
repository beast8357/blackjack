# frozen_string_literal: true

class Finalizer
  class << self
    def finalize(player, dealer, game_bank_account)
      puts 'Preparing results...'
      sleep(1.5)
      winner = Judge.judge(player, dealer)
      Results.message(winner)
      PlayerStats.show(player)
      DealerStats.show(dealer)
      MoneyManager.manage(player, dealer, winner, game_bank_account)
    end
  end
end
