require_relative 'game_bank'

class Judge
  def self.determine_winner(player, dealer, game_bank)
    print "Game results: "
    if condition_one?(player.score, dealer.score)
      puts "You won!"
      game_bank.transfer(player, game_bank.money)
      game_bank.clear
    elsif condition_two?(player.score, dealer.score)
      puts "Dealer won!"
      game_bank.transfer(dealer, game_bank.money)
      game_bank.clear
    elsif condition_three?(player.score, dealer.score)
      puts "Draw!"
      game_bank.transfer(player, game_bank.money / 2)
      game_bank.transfer(dealer, game_bank.money / 2)
      game_bank.clear
    end
  end

  private

  def self.condition_one?(p_score, d_score)
    p_score <= 21 && (p_score > d_score || d_score > 21)
  end

  def self.condition_two?(p_score, d_score)
    d_score <= 21 && (d_score > p_score || p_score > 21)
  end

  def self.condition_three?(p_score, d_score)
    p_score == d_score ||
    p_score > 21 && d_score > 21
  end
end
