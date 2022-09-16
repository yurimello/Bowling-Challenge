# This class is used to decorate LastFrameComponent and calculate its score
class LastFrameDecorator < FrameDecorator
  def calculate_roll_scores
    first_two_rolls = rolls.first(2)
    roll_scores = if strike?
                    %w[X X]
                  elsif spare?
                    [rolls.first.score, '/']
                  else
                    first_two_rolls.map(&:score_with_foul)
                  end
    roll_scores << last_roll_score if rolls.size == LAST_FRAME_MAX_STRIKE
    roll_scores
  end

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

  private

  def last_roll_score
    rolls.last.score == STRIKE ? 'X' : rolls.last.score_with_foul
  end
end
