class ScoreCounter
  @points = 0

  class << self
    attr_reader :points
  end

  def self.score(cards)
    @points = 0
    cards.each { |card| calculate(card) }
    points
  end

  private

  def self.calculate(card)
    if card.chr.to_i >= 2
      @points += card.chr.to_i
    elsif card.chr.to_i == 1 || card.chr == 'Q' || card.chr == 'K' || card.chr == 'J'
      @points += 10
    elsif card.chr == 'A'
      @points += ace_points(self.points)
    end
  end

  def self.ace_points(points)
    if points + 11 > 21
      1
    elsif points + 11 <= 21
      11
    end
  end
end
