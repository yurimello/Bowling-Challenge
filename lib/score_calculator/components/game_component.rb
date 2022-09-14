# This class handles frame rolls
# Validates score range 0..10
class GameComponent < Component
  def initialize(validator_strategy: Validator::ValidatorStrategy, override_validators: {})
    super
    validate(:number_range, :players, children.size, { min: 1, max: 5 })
  end

  # @param component [PlayerComponent] the player component
  # @retrun [GameComponent] validated
  def add(component)
    super
    validate(:number_range, :players, children.size, { min: 1, max: 5 })
    self
  end
end
