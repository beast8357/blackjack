require_relative 'player'

class Score
  attr_accessor :points, :player

  def initialize(player)
    @points = 0
    @player = player
  end

  def calculate
    player.cards.each do |card|
      if condition_one(card)
        self.points += card[0].to_i
      elsif condition_two(card)
        self.points += 10
      elsif condition_three(card)
        calculate_for_ace
      end
    end
  end

  private

  def condition_one(card)
    card[0].to_i >= 2
  end

  def condition_two(card)
    card[0].to_i == 1 ||
    card[0] == 'Q' || card[0] == 'K' || card[0] == 'J'
  end

  def condition_three(card)
    card[0] == 'A'
  end

  def calculate_for_ace
    if points + 11 > 21
      self.points += 1
    elsif points + 11 <= 21
      self.points += 11
    end
  end
end
