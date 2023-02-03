require_relative 'bank_account'
require_relative 'score_counter'

class Dealer
  attr_reader :bank_account, :cards, :score

  def initialize
    @bank_account = BankAccount.new
    @cards = []
    @score = 0
  end

  def take_starting_cards(deck)
    cards.clear
    until cards.count == 2
      pick_card(deck)
    end
    @score = ScoreCounter.score(cards)
  end

  def take_extra_card(deck)
    if cards.count == 2
      until cards.count == 3
        pick_card(deck)
      end
    end
    @score = ScoreCounter.score(cards)
  end

  def encrypt(object)
    object.map { |element| element = '*' }
  end

  private

  def pick_card(deck)
    cards << deck.pop
  end
end
