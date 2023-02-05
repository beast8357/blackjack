class ActionOptions
  def self.options
    [
      { name: 'Skip turn', action: :skip_turn },
      { name: 'Take an extra card', action: :extra_card },
      { name: 'Flip cards', action: :flip_cards }
    ]
  end

  def self.display
    options.each.with_index(1) { |option, index| puts "#{index}. #{option[:name]}" }
  end
end
