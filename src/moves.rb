class Moves
  def self.list
    [
      { option: 'Skip turn', action: :skip_turn },
      { option: 'Take an extra card', action: :take_extra_card },
      { option: 'Flip cards', action: :flip_cards },
      { option: 'Show my stats', action: :stats }
    ]
  end
end
