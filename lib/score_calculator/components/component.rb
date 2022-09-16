# This class was designed to implements Composite pattern
# It Handles the tree method as `#add` and add components as children and parents
# @abstract
class Component
  attr_reader :errors, :children, :foul
  attr_accessor :parent, :name, :score, :id

  def initialize(validator_strategy = Validator::ComponentValidatorStrategy.new)
    @errors = {}
    @children = []
    @parent = nil
    @validator_strategy = validator_strategy
  end

  def add(component)
    component.parent = self
    @children << component
    self
  end

  def run_validations; end

  def valid?
    @errors.empty?
  end

  def score_with_foul; end

  private

  def validate(*args)
    _validator, on = *args
    validation = @validator_strategy.validate(*args)
    if validation.valid?
      @errors.delete(on)
    else
      @errors[on] = { error: validation.error, exception: validation.exception }
    end
    self
  end
end
