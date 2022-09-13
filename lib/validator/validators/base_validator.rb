module Validator
  # This class is the interface of validators
  # @abstract
  class BaseValidator
    attr_reader :error, :exception

    def validate(*args); end

    # Checks if there is any error
    # @return [Boolean]
    def valid?
      error.nil?
    end
  end
end
