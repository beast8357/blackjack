# frozen_string_literal: true

class DealerTurn
  THRESHOLD = 17
  MAX_CARDS_IN_HAND = 3

  class << self
    def decide(dealer, deck)
      puts "Dealer's thinking..."
      sleep(1.5)
      if dealer.score < THRESHOLD && dealer.cards.count < MAX_CARDS_IN_HAND
        puts 'Dealer has taken an extra card'
        dealer.take_extra_card(deck)
      else
        puts 'Dealer has skipped his turn'
      end
    end
  end
end
