module Validator
  class MissingValidatorError < StandardError; end

  class NumberOutOfRangeError < StandardError; end

  class BlankStringError < StandardError; end
end
