module Validator
  class InvalidFormatError < StandardError; end

  class NotFoundFileError < StandardError; end
end

class NotImplementdError < StandardError; end

class MissingParser < StandardError; end
