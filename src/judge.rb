class Judge
  @player_money = 0
  @dealer_money = 0
  @player_score = 0
  @dealer_score = 0

  class << self
    attr_reader :player_money, :dealer_money, :player_score, :dealer_score
  end

  def self.determine_winner(player, dealer, game_bank_account)
    prepare_data(player, dealer, game_bank_account)
    analyze!(player, dealer, game_bank_account)
  end

  private

  def self.analyze!(player, dealer, game_bank_account)
    if player_score <= 21 && (player_score > dealer_score || dealer_score > 21)
      case_player(player, game_bank_account)
    elsif dealer_score <= 21 && (dealer_score > player_score || player_score > 21)
      case_dealer(dealer, game_bank_account)
    elsif player_score == dealer_score || (player_score > 21 && dealer_score > 21)
      case_draw(player, dealer, game_bank_account)
    end
  end

  def self.prepare_data(player, dealer, game_bank_account)
    @player_money = game_bank_account.player_money
    @dealer_money = game_bank_account.dealer_money
    @player_score = player.score
    @dealer_score = dealer.score
  end

  def self.case_draw(player, dealer, game_bank_account)
    # binding.irb
    puts "Draw!"
    give_money_back(player, dealer, game_bank_account)
  end

  def self.case_dealer(dealer, game_bank_account)
    # binding.irb
    puts "Dealer won!"
    give_winnings(dealer, game_bank_account)
  end

  def self.case_player(player, game_bank_account)
    # binding.irb
    puts "You won!"
    give_winnings(player, game_bank_account)
  end

  def self.give_winnings(person, game_bank_account)
    # binding.irb
    game_bank_account.transfer(person.bank_account, player_money + dealer_money)
  end

  def self.give_money_back(player, dealer, game_bank_account)
    # binding.irb
    game_bank_account.give_money_back_to_player(player.bank_account, player_money)
    game_bank_account.give_money_back_to_dealer(dealer.bank_account, dealer_money)
  end
end
