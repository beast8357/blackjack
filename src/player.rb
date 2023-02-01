require_relative 'bank'
require_relative 'deck'

class Player
  attr_accessor :name, :bank_account, :deck, :cards, :score

  def initialize(name)
    @name = name
    @bank_account = Bank.new
    @deck = Deck.new
    @cards = []
    @score = 0
  end

  def take_initial_cards
    until cards.count == 2
      pick_card
    end
  end

  def show_cards
    puts cards.join(' ')
  end

  def place_bet
    bank_account.deduct
  end

  def deposit
    bank_account.deposit
  end

  def skip_turn
    
  end

  def add_card
    if cards.count == 2
      until cards.count == 3
        pick_card
      end
    end
  end

  def flip_cards
    
  end

  private

  def pick_card
    card = deck.give
    cards << card unless cards.include?(card)
  end
end

t = Player.new("KOKO")
# t.take_initial_cards
# t.show_cards
