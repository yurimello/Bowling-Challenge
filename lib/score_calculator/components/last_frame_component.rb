# This class handles player frames
# Validates existance of rolls
class LastFrameComponent < Component
  def run_validations
    validate(:last_frame_strike, (name&.downcase || :last_frame).to_sym, children)
    self
  end
end
