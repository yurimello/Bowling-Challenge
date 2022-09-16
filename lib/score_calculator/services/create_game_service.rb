# This service class recieves a mapped matrix
# builds game object
# responds with built game object
class CreateGameService < BaseService
  def call(mapped_matrix, builder = GameBuilder.new)
    mapped_matrix.each_with_index do |(player_name, frames), index|
      player_id = index + 1
      builder.add_player(player_name, player_id)
      add_frames(builder, frames)
    end
    builder.validate_game!
    @response = builder.game
    self
  end

  private

  def add_frames(builder, frames)
    frames.each_with_index do |frame, index|
      frame_id = index + 1
      builder.add_frame(frame_id)
      frame.each_with_index do |roll, roll_index|
        roll_id = "#{frame_id}#{roll_index + 1}".to_i
        builder.add_roll(roll, roll_id)
      end
    end
    builder
  end
end
