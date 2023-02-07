# frozen_string_literal: true

class Game
  BET_AMOUNT = 10
  MAX_CARDS_IN_HAND = 3
  ACTIONS = {
    skip_turn: ->(ctx) { DealerTurn.decide(ctx.dealer, ctx.deck) },
    flip_cards: ->(ctx) { ctx.flag = true },
    extra_card: ->(ctx) do
      ctx.player.take_extra_card(ctx.deck)
      DealerTurn.decide(ctx.dealer, ctx.deck)
    end
  }.freeze

  attr_reader :deck, :player, :dealer, :bank_account
  attr_accessor :flag

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @bank_account = GameBankAccount.new
  end

  def start!
    @deck = Deck.deck
    @flag = false
    player.take_starting_cards(deck)
    dealer.take_starting_cards(deck)
    Bets.operate(player, dealer, bank_account, BET_AMOUNT)
    PlayerStats.show(player)
    DealerStats.show_encrypted(dealer)
    initiate_cycle
  end

  private

  def initiate_cycle
    loop do
      if flag == true || (player.cards.count == MAX_CARDS_IN_HAND &&
                          dealer.cards.count == MAX_CARDS_IN_HAND)
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
    print 'Your input: '
    index = gets.chomp.to_i - 1
    option = ActionOptions.options[index]
    action = option[:action]
    ACTIONS.fetch(action).call(self)
  end

  def play_again?
    option = Question.ask
    if option == '1' && player.bank_account.money >= BET_AMOUNT &&
                        dealer.bank_account.money >= BET_AMOUNT
      true
    elsif option == '2'
      LastMessage.display(player, dealer)
      false
    end
  end
end
