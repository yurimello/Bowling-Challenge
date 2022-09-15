# This class handles game component
# Validates score range 1..5
class GameComponent < Component
  def run_validations
    validate(:min_players, :players, children.size, { min: 1 })
    self
  end
end
