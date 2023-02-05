class PlayerStats
  def self.show(player)
    cards = player.cards.join(' ')
    score = player.score
    puts "=========================================="
    puts "Your cards: #{cards}"        
    puts "Your score: #{score}"
    puts "=========================================="
  end
end
