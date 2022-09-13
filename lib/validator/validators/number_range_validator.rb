module Validator
  # Implements BaseValidator and validates number range
  class NumberRangeValidator < Validator::BaseValidator
    # Validates range for a given number
    # @param on [Symbol] the attribute o case are being validated
    # @param value [Number] the value that will be validated
    # @param options [Hash] with `min:` and `max:` options
    # @return [Validator::NumberRangeValidator]
    def validate(on, value, options)
      min = options[:min] || 0
      max = options[:max]
      return self if (min..max).include?(value)

      @error = "Number #{value} is out of range on #{on}"
      @exception = Validator::NumberOutOfRangeError
      self
    end
  end
end
