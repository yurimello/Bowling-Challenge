module Validator
  # Implements BaseValidator and validates number range
  class StrikeValidator < Validator::BaseValidator
    # Validates range for a given number
    # @param on [Symbol] the attribute o case are being validated
    # @param value [Array[RollComponent]] the value that will be validated
    # @param options [Hash] with `min:` and `max:` options
    # @return [Validator::StrikeValidator]
    def validate(on, value, _options)
      scores = value.map(&:score)
      return self if scores.size == 1 && scores.first == STRIKE
      return self if scores.size == 2 && scores.first != STRIKE

      @error = "Invalid Strike on #{on}"
      @exception = InvalidStrike
      self
    end
  end
end
