# This class handles player frames
# Validates existance of rolls
class FrameComponent < Component
  def initialize(validator_strategy: Validator::ValidatorStrategy, override_validators: {})
    default_validator = { strike: Validator::StrikeValidator }
    override_validators = default_validator.merge(override_validators)
    super(validator_strategy: validator_strategy, override_validators: override_validators)
  end

  # @param component [RollComponent] the roll component
  # @retrun [FrameComponent] validated and with stored rolls
  def add(component)
    super
    validate(:number_range, :rolls, children.size, { min: 1, max: 2 })
    validate(:number_range, :rolls_score, children.sum(&:score), { max: 10 })
    validate(:strike, :frame_strike, children, { max: 10 })
  end
end
