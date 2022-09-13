module Validator
  # This class handles which validator will be used with given strategy
  class ValidatorStrategy
    # Handles strategy
    # @param validator [Symbol] the validator class will be used
    # @return [Validator::BaseValidator] validator to use
    def validation(validator)
      case validator
      when :number_range
        NumberRangeValidator.new
      else
        raise Validator::MissingValidatorError, "missing validator: #{validator}"
      end
    end
  end
end
