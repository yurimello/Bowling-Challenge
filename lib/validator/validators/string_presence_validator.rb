module Validator
  # Implements BaseValidator and validates number range
  class StringPresenceValidator < Validator::BaseValidator
    # Validates range for a given number
    # @param on [Symbol] the attribute o case are being validated
    # @param value [String] the value that will be validated
    # @return [Validator::StringPresenceValidator]
    def validate(on, value)
      return self unless value.to_s.empty?

      @error = "String #{value} is blank on #{on}"
      @exception = Validator::BlankStringError
      self
    end
  end
end
