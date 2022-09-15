require_relative './last_frame_strike_validator.rb'
require_relative './strike_validator.rb'
module Validator
  class ComponentValidatorStrategy < Validator::ValidatorStrategy
    COMPONENT_VALIDATORS = {
      last_frame_strike: Validator::LastFrameStrikeValidator,
      strike: Validator::StrikeValidator
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