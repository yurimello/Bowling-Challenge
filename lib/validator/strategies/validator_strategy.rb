module Validator
  # This class handles which validator will be used with given strategy
  class ValidatorStrategy
    VALIDATORS = {
      number_range: Validator::NumberRangeValidator,
      string_presence: Validator::StringPresenceValidator,
      array_emptiness: Validator::ArrayEmptinessValidator,
      string_matcher: Validator::StringMatcherValidator
    }.freeze

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

    def validate(validator, *args)
      validation(validator).validate(*args)
    end
  end
end
