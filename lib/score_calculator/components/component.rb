# This class handles models validations
# @abstract
class Component
  attr_reader :errors, :children, :id
  attr_accessor :parent, :name, :score

  def initialize(validator_strategy: Validator::ValidatorStrategy, override_validators: {})
    @errors = {}
    @children = []
    @parent = nil
    @validator_strategy = validator_strategy.new(override_validators: override_validators)
  end

  def valid?
    @errors.empty?
  end

  def add(component)
    component.parent = self
    @children << component
  end

  # def next
  #   sorted = brothers&.sort(&:id)
  #   return nil if sorted.nil?

  #   my_index = sorted.index(self)
  #   sorted[my_index + 1]
  # end

  def raise_validation_errors!
    raise @errors.values.first[:exception], @errors.values.first[:error] if @errors.values.size == 1

    raise ValidationError, (@errors.values.map { |e| e[:error] })
  end

  private

  def use_validator(validator)
    @validator_strategy.validation(validator)
  end

  def validate(validator, on, value, options = {})
    validation = use_validator(validator).validate(on, value, options)
    if validation.valid?
      @errors.delete(on)
    else
      @errors[on] = { error: validation.error, exception: validation.exception }
    end
    self
  end
end
