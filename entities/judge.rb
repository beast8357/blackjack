# frozen_string_literal: true

class Judge
  MAX_WIN_SCORE = 21

  class << self
    def judge(player, dealer)
      player_score = player.score
      dealer_score = dealer.score
      determine(player_score, dealer_score)
    end

    private

    def determine(player_score, dealer_score)
      if player_score <= MAX_WIN_SCORE && (player_score > dealer_score ||
                                           dealer_score > MAX_WIN_SCORE)
        player
      elsif dealer_score <= MAX_WIN_SCORE && (dealer_score > player_score ||
                                              player_score > MAX_WIN_SCORE)
        dealer
      elsif player_score == dealer_score || (player_score > MAX_WIN_SCORE &&
                                             dealer_score > MAX_WIN_SCORE)
        nil
      end
    end
  end
end
