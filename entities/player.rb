require_relative 'bank_account'
require_relative 'score_counter'

class Player 
  attr_reader :bank_account, :cards, :score
  attr_accessor :name

  def initialize
    @name = 'unknown'
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
end
