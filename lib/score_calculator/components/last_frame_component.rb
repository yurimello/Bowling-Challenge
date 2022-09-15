# This class handles player frames
# Validates existance of rolls
class LastFrameComponent < Component
  def validations
    validate(:last_frame_strike, :frame_strike, children)
    self
  end
end
