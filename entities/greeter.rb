# frozen_string_literal: true

class Greeter
  class << self
    def greet
      puts 'Welcome to Black Jack!'
      print 'To start the game, enter your name: '
    end
  end
end
