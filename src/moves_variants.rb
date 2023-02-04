class MovesVariants
  def self.variants
    [
      { option: 'Skip turn', action: :skip_turn },
      { option: 'Take an extra card', action: :take_extra_card },
      { option: 'Flip cards', action: :flip_cards },
      { option: 'Show my stats', action: :personal_stats }
    ]
  end

  def self.display
    variants.each.with_index(1) { |item, index| puts "#{index}. #{item[:option]}" }
  end
end
