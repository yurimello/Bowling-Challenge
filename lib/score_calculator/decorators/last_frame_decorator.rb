# This class is used to decorate LastFrameComponent and calculate its score
class LastFrameDecorator < FrameDecorator
  def calculate_score
    score = previous_frame&.score.to_i
    score + rolls.sum(&:score)
  end

  def strike?
    rolls.first.score == STRIKE
  end

  def spare?
    rolls.first(2).map(&:score).sum == STRIKE
  end
end
