# This class handles player frames
# Validates existance of rolls
class FrameComponent < Component
  def run_validations
    validate(:number_range, :rolls, children.size, { min: 1, max: 2 })
    validate(:number_range, :rolls_score, children.sum(&:score), { max: STRIKE })
    validate(:strike, (name&.downcase || :last_frame).to_sym, children, { max: STRIKE })
    self
  end
end
