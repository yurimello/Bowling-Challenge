# Include static method `call` and instantiate the object and call `#call`
module Callable
  def self.call(*args)
    new.call(*args)
  end
end
