require_relative 'player'

class ScoreCounter
  attr_accessor :points

  def initialize
    @points = 0
  end

  def calculate(cards)
    self.points = 0
    cards.each do |card|
      calc(card)
    end
    self.points
  end

  private

  def calc(card)
    if condition_one?(card)
      self.points += card.chr.to_i
    elsif condition_two?(card)
      self.points += 10
    elsif condition_three?(card)
      self.points += ace_points(points)
    end
  end

  def condition_one?(card)
    card.chr.to_i >= 2
  end

  def condition_two?(card)
    card.chr.to_i == 1 || card.chr == 'Q' || card.chr == 'K' || card.chr == 'J'
  end

  def condition_three?(card)
    card.chr == 'A'
  end

  def ace_points(points)
    if points + 11 > 21
      1
    elsif points + 11 <= 21
      11
    end
  end
end
