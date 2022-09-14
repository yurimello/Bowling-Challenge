require_relative './base_validator'
module Validator
  # Implements BaseValidator and validates number range
  class ArrayEmptinessValidator < Validator::BaseValidator
    # Validates range for a given number
    # @param on [Symbol] the attribute o case are being validated
    # @param value [String] the value that will be validated
    # @return [Validator::StringPresenceValidator]
    def validate(on, value)
      return self unless value.empty?

      @error = "Array #{value} is blank on #{on}"
      @exception = EmptyArrayError
      self
    end
  end
end
