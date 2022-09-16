# This class was designed to implements Service paterns
# It has only one public method: `call`
# And it should return self with a response
# @abstract
class BaseService
  attr_reader :response

  def self.call(object)
    new.call(object)
  end

  def initialize(validator_strategy = Validator::ValidatorStrategy.new)
    @validator_strategy = validator_strategy
  end

  def call(object); end

  private

  def validate(*args)
    validation = @validator_strategy.validate(*args)
    raise validation.exception, validation.error unless validation.valid?
  end
end
