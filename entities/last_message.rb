# frozen_string_literal: true

class LastMessage
  class << self
    def display(player, dealer)
      if player.bank_account.money.zero?
        puts "You've got no money to play :("
      elsif dealer.bank_account.money.zero?
        puts "Dealer's got no money to play :("
      else
        puts 'See you later ;)'
      end
    end
  end
end
