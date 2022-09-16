# This class handles frame rolls
# Validates score range 0..10
class RollComponent < Component
  # @param score [number] the roll score
  # @retrun [RollComponent] validated and with stored score
  def add(score)
    @score = score
    @score = nil if score.nil? || score.to_s.empty? || score.is_a?(String)
    @foul = score.to_s.match?(/f/i)
    @score = score.to_s.gsub(/( |f)/i, '0').to_i if @foul
    self
  end

  def run_validations
    validate(:number_range, :score, @score, { min: 0, max: STRIKE })
  end

  def score_with_foul
    return 'F' if foul

    score
  end
end
