# frozen_string_literal: true

class PlayerStats
  class << self
    def show(player)
      cards = player.cards.join(' ')
      score = player.score
      puts '=========================================='
      puts "Your cards: #{cards}"
      puts "Your score: #{score}"
      puts '=========================================='
    end
  end
end
