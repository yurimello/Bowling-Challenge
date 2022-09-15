# This class handles frame rolls
# Validates score range 0..10
class PlayerComponent < Component
  # @param component [FrameComponent] the frame component
  # @retrun [PlayerComponent] validated and with stored rolls
  def run_validations
    validate(:number_range, :frames, children.size, { min: 10, max: 10 })
    validate(:string_presence, :name, name)
    self
  end
end
