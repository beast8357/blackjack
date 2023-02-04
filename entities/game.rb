require_relative 'player'
require_relative 'dealer'
require_relative 'game_bank_account'
require_relative 'deck'
require_relative 'bets'
require_relative 'player_stats'
require_relative 'dealer_stats'
require_relative 'action_options'
require_relative 'finalizer'
require_relative 'question'

class Game
  attr_reader :deck, :flag, :player, :dealer, :bank_account, :bet_amount

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @bank_account = GameBankAccount.new
    @bet_amount = 10
  end

  def start!
    @deck = Deck.deck
    @flag = false
    player.take_starting_cards(deck)
    dealer.take_starting_cards(deck)
    Bets.operate(player, dealer, bank_account, bet_amount)
    PlayerStats.show(player)
    DealerStats.show_encrypted(dealer)
    cycle
  end

  private

  def cycle
    loop do
      if flag == true || (player.cards.count == 3 && dealer.cards.count == 3)
        break
      else
        continue
      end
    end
    Finalizer.finalize(player, dealer, bank_account)
    start! if play_again?
  end

  def continue
    ActionOptions.display
    print "Your input: "
    option = ActionOptions.options[gets.chomp.to_i - 1]
    puts "You decided to #{option[:name]}"
    self.send(option[:action])
  end

  def skip_turn
    dealer_turn
  end

  def take_extra_card
    player.take_extra_card(deck)
    dealer_turn
  end

  def flip_cards
    @flag = true
  end

  def dealer_turn
    if dealer.score >= 17
      puts "Dealer has skipped his turn"
    else
      puts "Dealer has takem an extra card"
      dealer.take_extra_card(deck)
    end
  end

  def play_again?
    Question.ask
    option = gets.chomp.to_i
    if option == 1 && player.bank_account.money >= 10 && dealer.bank_account.money >= 10
      true
    else
      last_message
      false
    end
  end

  def last_message
    if player.bank_account.money.zero?
      puts "You've got no money to play :("
    elsif dealer.bank_account.money.zero?
      puts "Dealer's got no money to play :("
    else
      puts "See you later ;)"
    end
  end
end
