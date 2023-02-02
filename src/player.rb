require_relative 'bank'
require_relative 'deck'

class Player
  attr_accessor :name, :bank_account, :cards, :score

  def initialize
    @name = ''
    @bank_account = Bank.new
    @cards = []
    @score = 0
  end

  def stats
    puts "=========================================="
    puts "Your cards: #{cards.join(' ')}"        
    puts "Your score: #{score}"
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

  def flip_cards
    true
  end

  private

  def pick_card
    cards << Deck.give
  end
end
