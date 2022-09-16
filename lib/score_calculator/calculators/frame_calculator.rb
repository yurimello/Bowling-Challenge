# This class is used to decorate FrameComponent and calculate its score
class FrameCalculator
  def initialize(object)
    @object = object
  end

  def calculate_roll_scores
    return ['X'] if strike?
    return [rolls.first.score_with_foul, '/'] if spare?

    rolls.map(&:score_with_foul)
  end

  def calculate_score
    score = previous_frame&.score.to_i
    score += rolls.sum(&:score)
    if strike?
      rolls_qty = 2
    elsif spare?
      rolls_qty = 1
    else
      return score
    end

    score + next_rolls(rolls_qty).sum(&:score)
  end

  private

  def strike?
    rolls.first.score == STRIKE
  end

  def spare?
    rolls.map(&:score).sum == STRIKE
  end

  def rolls
    decorated.children
  end

  def next_rolls(qty = 1)
    frames = next_frames(qty)
    frames.map(&:children).flatten.first(qty)
  end

  def next_frames(qty = 1)
    next_index = related_frames.index(decorated) + 1
    to_position = next_index + (qty - 1)
    related_frames.slice(next_index, to_position)
  end

  def previous_frame
    self_index = related_frames.index(decorated)
    return nil if self_index.zero?

    related_frames[self_index - 1]
  end

  def related_frames
    @related_frames ||= decorated.parent.children
  end

  def decorated
    @object
  end
end
