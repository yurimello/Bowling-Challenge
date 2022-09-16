# This service class recieves a mapped matrix
# builds game object
# responds with built game object
class CreateGameService < BaseService
  def call(mapped_matrix, builder = GameBuilder.new)
    mapped_matrix.each do |player_name, frames|
      builder.add_player(player_name)
      add_frames(builder, player_name, frames)
    end
    builder.validate_game!
    @response = builder.game
    self
  end

  private

  def add_frames(builder, player_name, frames)
    frames.each_with_index do |frame, index|
      frame_id = index + 1
      builder.add_frame(player_name, frame_id)
      frame.each do |roll|
        builder.add_roll(player_name, roll)
      end
    end
    builder
  end
end
