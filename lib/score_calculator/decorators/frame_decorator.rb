require 'delegate'
# This class is used to decorate FrameComponent and calculate its score
class FrameDecorator < SimpleDelegator
  def calculate_roll_scores
    return ['', 'X'] if strike?
    return [rolls.first, '/'] if spare?

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

  def strike?
    rolls.first.score == STRIKE
  end

  def spare?
    rolls.map(&:score).sum == STRIKE
  end

  private

  def rolls
    delegated.children
  end

  def next_rolls(qty = 1)
    frames = next_frames(qty)
    frames.map(&:children).flatten.first(qty)
  end

  def next_frames(qty = 1)
    self_index = related_frames.index(delegated)
    position = self_index + qty
    related_frames.slice(self_index, position)
  end

  def previous_frame
    self_index = related_frames.index(delegated)
    return nil if self_index.zero?

    related_frames[self_index - 1]
  end

  def related_frames
    @related_frames ||= delegated.parent.children.sort_by(&:id)
  end

  def delegated
    __getobj__
  end
end
