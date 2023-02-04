class ActionOptions
  def self.options
    [
      { name: 'Skip turn', action: :skip_turn },
      { name: 'Take an extra card', action: :take_extra_card },
      { name: 'Flip cards', action: :flip_cards }
    ]
  end

  def self.display
    options.each.with_index(1) { |item, index| puts "#{index}. #{item[:name]}" }
  end
end
