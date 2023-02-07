# frozen_string_literal: true

class Dealer
  INITIAL_CARDS_NUMBER = 2
  MAX_CARDS_NUMBER = 3

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
    cards << deck.pop until cards.count == INITIAL_CARDS_NUMBER
    @score = ScoreCounter.new(cards).count
  end

  def take_extra_card(deck)
    if cards.count == INITIAL_CARDS_NUMBER
      cards << deck.pop until cards.count == MAX_CARDS_NUMBER
    end
    @score = ScoreCounter.new(cards).count
  end

  def encrypt(object)
    object.map { |element| element = 'X' }
  end
end
