module Validator
  # Implements BaseValidator and validates number range
  class LastFrameStrikeValidator < Validator::BaseValidator
    # Validates range for a given number
    # @param on [Symbol] the attribute o case are being validated
    # @param value [Array[Number]] the value that will be validated
    # @param options [Hash] with `min:` and `max:` options
    # @return [Validator::StrikeValidator]
    def validate(on, value)
      if exceeded_rolls?(value) || unavailable_extra_rolls?(value) || strike_withou_extra_rolls?(value)
        @error = "Invalid Strike on #{on}"
        @exception = InvalidStrike
        return self
      end

      self
    end

    private

    def exceeded_rolls?(value)
      value.size > LAST_FRAME_MAX_STRIKE
    end

    def unavailable_extra_rolls?(value)
      first_two_scores = value.first(2)&.sum(&:score)
      first_two_scores < STRIKE && value.size >= LAST_FRAME_MAX_STRIKE
    end

    def strike_withou_extra_rolls?(value)
      value.first.score == STRIKE && value.size == 1
    end
  end
end
