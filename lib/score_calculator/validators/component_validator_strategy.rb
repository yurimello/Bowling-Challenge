require_relative './last_frame_strike_validator'
require_relative './strike_validator'
require_relative './min_players_validator'
module Validator
  # This class handles which validator will be used with given strategy
  class ComponentValidatorStrategy < Validator::ValidatorStrategy
    COMPONENT_VALIDATORS = {
      last_frame_strike: Validator::LastFrameStrikeValidator,
      strike: Validator::StrikeValidator,
      min_players: Validator::MinPlayersValidator
    }.freeze

    # Handles strategy
    # @param validator [Symbol] the validator class will be used
    # @return [Validator::BaseValidator] validator to use
    def validation(validator)
      return COMPONENT_VALIDATORS[validator].new if COMPONENT_VALIDATORS[validator]

      super
    end
  end
end
