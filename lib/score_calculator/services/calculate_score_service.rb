# This service class recieves a game
# and calculates its scores
# responds with a copy of game object
class CalculateScoreService < BaseService
  def call(game, frame_calculator = FrameCalculator, last_frame_calculator = LastFrameCalculator)
    @frame_calculator = frame_calculator
    @last_frame_calculator = last_frame_calculator

    @response = game
    @response.children.each do |player|
      player.children.each do |frame|
        calculate_frame(frame)
      end
    end
    self
  end

  private

  def calculate_frame(frame)
    decorated_frame = decorate_frame(frame)
    frame.score = decorated_frame.calculate_score
    calculated_roll_scores = decorated_frame.calculate_roll_scores
    calculated_roll_scores.each_with_index do |score, index|
      roll = frame.children[index]
      roll.name = score
    end
  end

  def decorate_frame(frame)
    return @frame_calculator.new(frame) if frame.id < MAX_FRAMES

    @last_frame_calculator.new(frame)
  end
end
