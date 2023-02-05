class DealerStats
  def self.show(dealer)
    cards = dealer.cards.join(' ')
    score = dealer.score
    puts "=========================================="
    puts "Dealer's cards: #{cards}"
    puts "Dealer's score: #{score}"
    puts "=========================================="
  end

  def self.show_encrypted(dealer)
    encrypted_cards = dealer.encrypt(dealer.cards).join(' ')
    puts "=========================================="
    puts "Dealer's cards: #{encrypted_cards}"
    puts "=========================================="
  end
end
