require_relative './format_validator'
require_relative './file_existance_validator'
module Validator
  # This class handles which validator will be used with given strategy
  class ParserValidatorStrategy < Validator::ValidatorStrategy
    PARSER_VALIDATORS = {
      format: Validator::FormatValidator,
      file_exist: Validator::FileExistanceValidator
    }.freeze

    # Handles strategy
    # @param validator [Symbol] the validator class will be used
    # @return [Validator::BaseValidator] validator to use
    def validation(validator)
      return PARSER_VALIDATORS[validator].new if PARSER_VALIDATORS[validator]

      super
    end
  end
end
