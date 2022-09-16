# This service class recieves a game
# and calculates its scores
# responds with a copy of game object
class CalculateScoreService < BaseService
  def call(game, frame_decorator = FrameDecorator, last_frame_decorator = LastFrameDecorator)
    @frame_decorator = frame_decorator
    @last_frame_decorator = last_frame_decorator

    @response = game
    @response.children.each do |player|
      player.children.sort_by(&:id).each do |frame|
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
      roll.score = score
    end
  end

  def decorate_frame(frame)
    return @frame_decorator.new(frame) if frame.instance_of?(FrameComponent)

    @last_frame_decorator.new(frame)
  end
end
