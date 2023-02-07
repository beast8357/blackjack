# frozen_string_literal: true

class Results
  class << self
    def message(winner)
      print 'Game results: '
      if winner.is_a? Player
        puts 'You won!!!'
      elsif winner.is_a? Dealer
        puts 'Dealer won!!!'
      elsif winner.nil?
        puts 'Draw!!!!'
      end
    end
  end
end
