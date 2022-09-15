# This class handles player frames
# Validates existance of rolls
class FrameComponent < Component
  def validations
    validate(:number_range, :rolls, children.size, { min: 1, max: 2 })
    validate(:number_range, :rolls_score, children.sum(&:score), { max: 10 })
    validate(:strike, :frame_strike, children, { max: 10 })
    self
  end
end
