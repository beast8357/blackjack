# frozen_string_literal: true

class ScoreCounter
  MAX_WIN_SCORE = 21
  MIN_POINTS = 2
  MAX_POINTS = 10
  MIN_ACE_POINTS = 1
  MAX_ACE_POINTS = 11

  attr_reader :score, :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @score = 0
    cards.each { |card| calculate(card) }
    score
  end

  private

  def calculate(card)
    if card.chr.to_i >= MIN_POINTS
      @score += card.chr.to_i
    elsif card.chr == '1' || card.chr == 'Q' || card.chr == 'K' || card.chr == 'J'
      @score += MAX_POINTS
    elsif card.chr == 'A'
      @score += ace_points(score)
    end
  end

  def ace_points(score)
    if score + MAX_ACE_POINTS > MAX_WIN_SCORE
      MIN_ACE_POINTS
    elsif score + MAX_ACE_POINTS <= MAX_WIN_SCORE
      MAX_ACE_POINTS
    end
  end
end
