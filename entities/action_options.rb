# frozen_string_literal: true

class ActionOptions
  class << self
    def options
      [
        { name: 'Skip turn', action: :skip_turn },
        { name: 'Take an extra card', action: :extra_card },
        { name: 'Flip cards', action: :flip_cards }
      ].freeze
    end

    def display
      options.each.with_index(1) { |option, index| puts "#{index}. #{option[:name]}" }
    end
  end
end
