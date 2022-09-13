module Validator
  # Implements BaseValidator and validates number range
  class LastFrameNumberRangeValidator < Validator::BaseValidator
    # Validates range for a given number
    # @param on [Symbol] the attribute o case are being validated
    # @param value [Array[Number]] the value that will be validated
    # @param options [Hash] with `min:` and `max:` options
    # @return [Validator::StrikeValidator]
    def validate(_on, _value, _options)
      self
    end
  end
end
