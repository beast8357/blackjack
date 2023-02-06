require_relative 'bank_account'
require_relative 'score_counter'

class Dealer
  attr_reader :bank_account, :cards, :score

  def initialize
    @bank_account = BankAccount.new
    @score = 0
  end

  def place_bet(bet_amount)
    bank_account.deduct(bet_amount)
  end

  def take_starting_cards(deck)
    @cards = []
    cards << deck.pop until cards.count == 2
    @score = ScoreCounter.count(cards)
  end

  def take_extra_card(deck)
    if cards.count == 2
      cards << deck.pop until cards.count == 3
    end
    @score = ScoreCounter.count(cards)
  end

  def encrypt(object)
    object.map { |element| element = 'X' }
  end
end
