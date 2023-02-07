# frozen_string_literal: true

class Question
  class << self
    def ask
      puts 'Wanna play once more?'
      puts '1. Yes'
      puts '2. No'
      print 'Your input: '
      gets.chomp
    end
  end
end
