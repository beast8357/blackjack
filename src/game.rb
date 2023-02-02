require_relative 'player'
require_relative 'dealer'
require_relative 'game_bank'
require_relative 'score_counter'
require_relative 'moves'
require_relative 'greeter'
require_relative 'judge'

class Game
  attr_accessor :moves, :bank_account, :deck, :player, :dealer, :p_score, :d_score, :flag

  def initialize
    @moves = Moves.list
    @bank_account = GameBank.new
    @deck = Deck.generate
    @player = Player.new
    @dealer = Dealer.new
    @p_score = ScoreCounter.new
    @d_score = ScoreCounter.new
    @flag = false
  end

  def start
    initiate
    loop do
      run_interaction
      break if finish?
    end
    start if play_again?
  end

  private

  def initiate
    player.take_starting_cards
    dealer.take_starting_cards
    player.score = p_score.calculate(player.cards)
    dealer.score = d_score.calculate(dealer.cards)
    player.stats
    dealer.encrypted_stats
  end

  def deal
    player.place_bet
    bank_account.take_bet
    dealer.place_bet
    bank_account.take_bet
  end

  def run_interaction
    deal
    display_moves
    item = moves[gets.chomp.to_i - 1]
    action = item[:action]
    player.send(action)
    decide_next(action)
  end

  def play_again?
    puts "Would you like to play once more?\n" << "1. Yes\n" << "2. No"
    print "Your answer: "
    selection = gets.chomp
    possible?(selection)
  end

  def possible?(selection)
    if selection.to_i == 1
      enough_money?
    elsif selection.to_i == 2
      false
    end
  end

  def enough_money?
    if player.bank_account.money.zero?
      puts "Your bank account is empty :("
      false
    elsif dealer.bank_account.money.zero?
      puts "Dealer's bank account is empty :("
      false
    else
      true
    end
  end

  def finish?
    if flag == true || (player.cards.count == 3 && dealer.cards.count == 3)
      calc_players_scores
      player.stats
      dealer.stats
      Judge.determine_winner(player, dealer, bank_account)
      true
    else 
      false
    end
  end

  def decide_next(action)
    if action == :skip_turn
      dealer_turn
    elsif action == :take_extra_card
      calc_players_scores
      dealer_turn
    elsif action == :flip_cards
      self.flag = true
    end
  end

  def dealer_turn
    puts "Dealer's turn..."
    sleep(1)
    if dealer.score >= 17 || dealer.cards.count == 3
      dealer.skip_turn
      puts "Dealer has skipped his turn"
    elsif dealer.score < 17
      dealer.take_extra_card
      puts "Dealer has taken an extra card"
    end
  end

  def display_moves
    puts "Possible moves:"
    moves.each.with_index(1) { |item, index| puts "#{index}. #{item[:option]}" }
    print "Your turn: "
  end

  def calc_players_scores
    player.score = p_score.calculate(player.cards)
    dealer.score = d_score.calculate(dealer.cards)
  end
end

game = Game.new
Greeter.greet
game.player.name = gets.chomp
game.start
