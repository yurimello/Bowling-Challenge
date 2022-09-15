module Validator
  # Implements BaseValidator and validates number range
  class LastFrameStrikeValidator < Validator::BaseValidator
    # Validates range for a given number
    # @param on [Symbol] the attribute o case are being validated
    # @param value [Array[Number]] the value that will be validated
    # @param options [Hash] with `min:` and `max:` options
    # @return [Validator::StrikeValidator]
    def validate(on, value)
      total_score = value.sum(&:score)
      total_rolls = value.size
      many_strikes = total_score / STRIKE
      return self if many_strikes == LAST_FRAME_MAX_STRIKE
      return self if many_strikes == (total_rolls - 1)

      @error = "Invalid Strike on #{on}"
      @exception = InvalidStrike
      self
    end
  end
end
