module Validator
  # Implements BaseValidator and validates number range
  class MinPlayersValidator < Validator::BaseValidator
    # Validates range for a given number
    # @param on [Symbol] the attribute o case are being validated
    # @param value [Number] the value that will be validated
    # @param options [Hash] with `min:` and `max:` options
    # @return [Validator::NumberRangeValidator]
    def validate(_on, value, options)
      min = options[:min] || 0
      return self if value >= min

      @error = "#{value} players is insufficient to play"
      @exception = Validator::InsufficientPlayersError
      self
    end
  end
end
