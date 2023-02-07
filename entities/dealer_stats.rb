# frozen_string_literal: true

class DealerStats
  class << self
    def show(dealer)
      cards = dealer.cards.join(' ')
      score = dealer.score
      puts '=========================================='
      puts "Dealer's cards: #{cards}"
      puts "Dealer's score: #{score}"
      puts '=========================================='
    end

    def show_encrypted(dealer)
      encrypted_cards = dealer.encrypt(dealer.cards).join(' ')
      puts '=========================================='
      puts "Dealer's cards: #{encrypted_cards}"
      puts '=========================================='
    end
  end
end
