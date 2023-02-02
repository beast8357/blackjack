require_relative 'bank'
require_relative 'deck'

class Dealer
  attr_accessor :bank_account, :cards, :score

  def initialize
    @bank_account = Bank.new
    @cards = []
    @score = 0
  end

  def encrypted_stats
    puts "=========================================="
    puts "Dealer's cards: #{encrypt(cards).join(' ')}"
    puts "Dealer's score: #{encrypt(score.to_s.chars).join()}"
    puts "=========================================="
  end

  def stats
    puts "=========================================="
    puts "Dealer's cards: #{cards.join(' ')}"
    puts "Dealer's score: #{score}"
    puts "=========================================="
  end

  def take_starting_cards
    cards.clear
    until cards.count == 2
      pick_card
    end
  end

  def place_bet
    bank_account.deduct
  end

  def skip_turn
    true
  end

  def take_extra_card
    if cards.count == 2
      until cards.count == 3
        pick_card
      end
    end
  end

  private

  def encrypt(object)
    object.map { |element| element = '*' }
  end

  def pick_card
    cards << Deck.give
  end
end
