# This class is used to decorate LastFrameComponent and calculate its score
class LastFrameCalculator < FrameCalculator
  def calculate_roll_scores
    roll_scores = []

    rolls.first(2).each_with_index do |roll, index|
      roll_scores << roll_score(roll, index)
    end

    roll_scores << last_roll_score if rolls.size == LAST_FRAME_MAX_STRIKE
    roll_scores
  end

  def roll_score(roll, index)
    if spare?(rolls, index)
      '/'
    elsif roll.score == STRIKE
      'X'
    else
      roll.score_with_foul
    end
  end

  def calculate_score
    score = previous_frame&.score.to_i
    score + rolls.sum(&:score)
  end

  private

  def spare?(rolls, index)
    index == 1 && rolls.first(2).sum(&:score) == STRIKE
  end

  def last_roll_score
    rolls.last.score == STRIKE ? 'X' : rolls.last.score_with_foul
  end
end
