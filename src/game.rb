require_relative 'greeter'
require_relative 'deck'
require_relative 'player'
require_relative 'dealer'
require_relative 'player_stats'
require_relative 'dealer_stats'
require_relative 'game_bank_account'
require_relative 'judge'
require_relative 'money_manager'
require_relative 'moves_variants'

class Game
  attr_reader :deck, :player, :dealer, :winner, :bank_account, :bet_amount

  def initialize
    @deck = Deck.deck
    @player = Player.new
    @dealer = Dealer.new
    @winner = Object.new
    @bank_account = GameBankAccount.new
    @bet_amount = 10
  end

  def start_session
    draw_cards
    betting_operations
    PlayerStats.show(player)
    DealerStats.show_encrypted(dealer)
    run_cycle
  end

  def run_cycle
    loop do
      if player.cards.count == 3 && dealer.cards.count == 3
        finish!
        break unless play_again?
      else
        MovesVariants.display
        print "Your input: "
        variant = MovesVariants.variants[gets.chomp.to_i - 1]
        puts "You decided to #{variant[:option]}"
        action = variant[:action]
        if action == :skip_turn
          dealer_turn
        elsif action == :take_extra_card
          player.take_extra_card(deck)
          dealer_turn
        elsif action == :flip_cards
          finish!
          break unless play_again?
        elsif action == :personal_stats
          PlayerStats.show(player)
        end
      end
    end
  end

  def dealer_turn
    if dealer.score >= 17
      puts "Dealer skipped"
    else
      puts "Dealer took an extra card"
      dealer.take_extra_card(deck)
    end
  end

  def finish!
    puts "FINISH!!!"
    PlayerStats.show(player)
    DealerStats.show(dealer)
    determine_winner
    results_message
    manage_money
  end

  def play_again?
    puts "Want to play once more?"
    puts "1. Yes"
    puts "2. No"
    print "Your option: "
    option = gets.chomp.to_i
    if option == 1 && player.bank_account.money >= 10 && dealer.bank_account.money >= 10
      @deck = Deck.deck
      true
    else
      puts "You've got no money to play :(" if player.bank_account.money.zero?
      puts "BYE!!!"
      false
    end
  end

  def draw_cards
    player.take_starting_cards(deck)
    dealer.take_starting_cards(deck)
  end

  def betting_operations
    player_bet = player.place_bet(bet_amount)
    dealer_bet = dealer.place_bet(bet_amount)
    bank_account.take_bet(player, player_bet)
    bank_account.take_bet(dealer, dealer_bet)
  end

  def determine_winner
    @winner = Judge.judge(player, dealer)
  end

  def results_message
    if winner.is_a? Player
      puts "You won!!!"
    elsif winner.is_a? Dealer
      puts "Dealer won!!!"
    elsif winner.nil?
      puts "Draw!!!!" 
    end
  end

  def manage_money
    winner.nil? ? MoneyManager.refund(player, dealer, bank_account) :
                  MoneyManager.give_winnings(winner, bank_account)
  end
end

game = Game.new
Greeter.greet
game.player.name = gets.chomp
game.start_session
