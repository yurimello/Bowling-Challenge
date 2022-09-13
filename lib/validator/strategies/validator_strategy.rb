module Validator
  # This class handles which validator will be used with given strategy
  class ValidatorStrategy
    VALIDATORS = { number_range: Validator::NumberRangeValidator }.freeze

    def initialize(override_validators: {})
      @validators = VALIDATORS.merge(override_validators)
    end

    # Handles strategy
    # @param validator [Symbol] the validator class will be used
    # @return [Validator::BaseValidator] validator to use
    def validation(validator)
      raise Validator::MissingValidatorError, "missing validator: #{validator}" unless @validators[validator]

      @validators[validator].new
    end
  end
end
