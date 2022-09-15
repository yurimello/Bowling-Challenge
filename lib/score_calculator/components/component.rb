# This class was designed to implements Composite pattern
# It Handles the tree method as `#add` and add components as children and parents
# @abstract
class Component
  attr_reader :errors, :children, :id
  attr_accessor :parent, :name, :score

  def initialize(validator_strategy = Validator::ComponentValidatorStrategy.new)
    @errors = {}
    @children = []
    @parent = nil
    @validator_strategy = validator_strategy
  end

  def add(component)
    component.parent = self
    @children << component
    validations
    self
  end

  # def next
  #   sorted = brothers&.sort(&:id)
  #   return nil if sorted.nil?

  #   my_index = sorted.index(self)
  #   sorted[my_index + 1]
  # end

  def validations
    self
  end

  def valid?
    @errors.empty?
  end

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
