# This class handles frame rolls
# Validates score range 0..10
class RollComponent < Component
  # @param score [number] the roll score
  # @retrun [RollComponent] validated and with stored score
  def add(score)
    @score = score
    self
  end

  def validations
    validate(:number_range, :score, @score, { min: 0, max: 10 })
  end
end
