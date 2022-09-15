# This class handles game component
# Validates score range 1..5
class GameComponent < Component

  def validations
    validate(:number_range, :players, children.size, { min: 1, max: 5 })
    self
  end
end
