class DealerTurn
  def self.decide(dealer, deck)
    puts "Dealer's thinking..."
    sleep(1.5)
    if dealer.score >= 17
      puts "Dealer has skipped his turn"
    else
      puts "Dealer has taken an extra card"
      dealer.take_extra_card(deck)
    end
  end
end
