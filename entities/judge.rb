class Judge
  def self.judge(player, dealer)
    player_score = player.score
    dealer_score = dealer.score
    if player_score <= 21 && (player_score > dealer_score || dealer_score > 21)
      player
    elsif dealer_score <= 21 && (dealer_score > player_score || player_score > 21)
      dealer
    elsif player_score == dealer_score || (player_score > 21 && dealer_score > 21)
      nil
    end
  end
end
