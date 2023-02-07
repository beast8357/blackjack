# frozen_string_literal: true

class Deck
  class << self
    def deck
      %w(2♣ 3♣ 4♣ 5♣ 6♣ 7♣ 8♣ 9♣ 10♣ Q♣ K♣ J♣ A♣ 
         2♠ 3♠ 4♠ 5♠ 6♠ 7♠ 8♠ 9♠ 10♠ Q♠ K♠ J♠ A♠ 
         2♦ 3♦ 4♦ 5♦ 6♦ 7♦ 8♦ 9♦ 10♦ Q♦ K♦ J♦ A♦ 
         2♥ 3♥ 4♥ 5♥ 6♥ 7♥ 8♥ 9♥ 10♥ Q♥ K♥ J♥ A♥).shuffle
    end
  end
end
