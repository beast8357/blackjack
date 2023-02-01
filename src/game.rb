require_relative 'player'
require_relative 'dealer'
require_relative 'game_bank'
require_relative 'score'

class Game
  attr_accessor :bank_account, :player, :dealer

  def initialize
    @bank_account = GameBank.new
  end

  def greet
    print "Welcome to Black Jack!\n" \
          "To start the game, enter your name: "
    create_players
  end

  def start
    give_initial_cards_to_players
    binding.irb
    create_player_score
    print "Your cards: #{player.show_cards}\n"
    print "Your score: #{player_score}"
  end

  def deposit
    bank_account.deposit
  end

  private

  def give_initial_cards_to_players
    player.take_initial_cards
  end

  def player_score
    player.score.calculate
    player.score.points
  end

  def create_player_score
    player.score = Score.new(player)
  end

  def create_players
    name = gets.chomp
    @player = Player.new(name)
    @dealer = Dealer.new
  end
end

t = Game.new
t.greet
t.start