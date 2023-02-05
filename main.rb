require_relative 'entities/greeter'
require_relative 'entities/game'
require_relative 'entities/player'
require_relative 'entities/dealer'
require_relative 'entities/game_bank_account'
require_relative 'entities/deck'
require_relative 'entities/bets'
require_relative 'entities/player_stats'
require_relative 'entities/dealer_stats'
require_relative 'entities/action_options'
require_relative 'entities/finalizer'
require_relative 'entities/question'
require_relative 'entities/last_message'
require_relative 'entities/dealer_turn'

game = Game.new
Greeter.greet
game.player.name = gets.chomp
game.start!
