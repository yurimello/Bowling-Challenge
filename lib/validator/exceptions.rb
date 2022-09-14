module Validator
  class MissingValidatorError < StandardError; end

  class NumberOutOfRangeError < StandardError; end

  class BlankStringError < StandardError; end

  class EmptyArrayError < StandardError; end

  class StringDoesNotMatch < StandardError; end
end
