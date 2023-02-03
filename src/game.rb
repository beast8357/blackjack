require_relative 'greeter'
require_relative 'deck'
require_relative 'player'
require_relative 'dealer'
require_relative 'game_bank_account'
require_relative 'judge'

class Game
  attr_reader :cards, :player, :dealer, :bank_account, :bet_size

  def initialize
    @cards = Deck.cards
    @player = Player.new
    @dealer = Dealer.new
    @bank_account = GameBankAccount.new
    @bet_size = 10
  end

  def draw_cards
    deck = cards.shuffle
    player.take_starting_cards(deck)
    dealer.take_starting_cards(deck)
  end

  def place_bets
    player.bank_account.deduct(bet_size)
    bank_account.take_bet(player, bet_size)
    dealer.bank_account.deduct(bet_size)
    bank_account.take_bet(dealer, bet_size)
  end

  def determine_winner
    Judge.determine_winner(player, dealer, bank_account)
  end

  private

  
end

game = Game.new
Greeter.greet
game.player.name = gets.chomp
game.player.score
game.draw_cards
game.place_bets
game.determine_winner
