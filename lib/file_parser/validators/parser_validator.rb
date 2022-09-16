require_relative './parser_validator_strategy'

# Include validation method
module ParserValidator
  def validate(*args)
    validation = validator_strategy.validate(*args)
    raise validation.exception, validation.error unless validation.valid?
  end

  private

  def validator_strategy
    @validator_strategy ||= Validator::ParserValidatorStrategy.new
  end
end
