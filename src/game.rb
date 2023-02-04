require_relative 'greeter'
require_relative 'deck'
require_relative 'player'
require_relative 'dealer'
require_relative 'game_bank_account'
require_relative 'judge'
require_relative 'money_manager'

class Game
  attr_reader :cards, :player, :dealer, :winner, :bank_account, :bet_amount

  def initialize
    @cards = Deck.cards
    @player = Player.new
    @dealer = Dealer.new
    @winner = Object.new
    @bank_account = GameBankAccount.new
    @bet_amount = 10
  end

  def draw_cards
    deck = cards.shuffle
    player.take_starting_cards(deck)
    dealer.take_starting_cards(deck)
  end

  def place_bets
    player.bank_account.deduct(bet_amount)
    bank_account.take_bet(player, bet_amount)
    dealer.bank_account.deduct(bet_amount)
    bank_account.take_bet(dealer, bet_amount)
  end

  def results
    @winner = Judge.judge(player, dealer)
    puts results_message
  end

  def manage_money
    if winner_present?
      MoneyManager.give_winnings(winner, game_bank_account)
    else
      MoneyManager.refund(player, dealer, game_bank_account)
    end
  end

  private

  def results_message
    if winner.is_a? Player
      "You won!"
    elsif winner.is_a? Dealer
      "Dealer won!"
    else
      "Draw!"
    end
  end

  def winner_present?
    binding.irb
    if winner.is_a? Player || winner.is_a? Dealer
      true
    else
      false
    end
  end
end

game = Game.new
Greeter.greet
game.player.name = gets.chomp
game.player.score
game.draw_cards
game.place_bets
game.results
game.manage_money
