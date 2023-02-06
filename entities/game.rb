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
    initiate_cycle
  end

  private

  def initiate_cycle
    loop do
      if flag == true || (player.cards.count == 3 && dealer.cards.count == 3)
        break
      else
        step!
      end
    end
    Finalizer.finalize(player, dealer, bank_account)
    start! if play_again?
  end

  def step!
    ActionOptions.display
    print "Your input: "
    option = ActionOptions.options[gets.chomp.to_i - 1]
    self.send(option[:action])
  end

  def skip_turn
    DealerTurn.decide(dealer, deck)
  end

  def extra_card
    player.take_extra_card(deck)
    DealerTurn.decide(dealer, deck)
  end

  def flip_cards
    @flag = true
  end

  def play_again?
    option = Question.ask
    if option == 1 && player.bank_account.money >= 10 && dealer.bank_account.money >= 10
      true
    else
      LastMessage.display(player, dealer)
      false
    end
  end
end
