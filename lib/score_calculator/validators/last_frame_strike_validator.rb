module Validator
  # Implements BaseValidator and validates number range
  class LastFrameStrikeValidator < Validator::BaseValidator
    # Validates range for a given number
    # @param on [Symbol] the attribute o case are being validated
    # @param value [Array[Number]] the value that will be validated
    # @param options [Hash] with `min:` and `max:` options
    # @return [Validator::StrikeValidator]
    def validate(on, value)
      total_rolls = value.size
      return self if value.first.score == STRIKE && total_rolls == LAST_FRAME_MAX_STRIKE
      return self if total_rolls == 2

      @error = "Invalid Strike on #{on}"
      @exception = InvalidStrike
      self
    end
  end
end
