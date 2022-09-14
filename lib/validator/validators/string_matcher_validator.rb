require_relative './base_validator'
module Validator
  # Implements BaseValidator and validates number range
  class StringMatcherValidator < Validator::BaseValidator
    # Validates range for a given number
    # @param on [Symbol] the attribute o case are being validated
    # @param value [String] the value that will be validated
    # @return [Validator::StringPresenceValidator]
    def validate(on, value, pattern)
      return self if value.match?(pattern)

      @error = "String '#{value}' with '#{pattern}' on '#{on}'"
      @exception = StringDoesNotMatch
      self
    end
  end
end
