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
    encrypted_score = dealer.encrypt(dealer.score.to_s.chars).join()
    puts "=========================================="
    puts "Dealer's cards: #{encrypted_cards}"
    puts "Dealer's score: #{encrypted_score}"
    puts "=========================================="
  end
end
