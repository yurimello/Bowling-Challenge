# This class build and validates game
class GameBuilder
  attr_reader :game

  def initialize
    @game = GameComponent.new
    @game.id = 1
  end

  def add_player(player_name, player_id)
    player = PlayerComponent.new
    player.name = player_name
    player.id = player_id
    @player_id = player_id
    @game.add(player)
    self
  end

  def add_frame(frame_id)
    frame = last_frame_next? ? LastFrameComponent.new : FrameComponent.new
    frame.id = frame_id
    frame.name = "Frame #{frame.id}"
    game_player.add(frame)

    self
  end

  def add_roll(score, roll_id)
    roll = RollComponent.new
    roll.id = roll_id
    roll.add(score).run_validations
    current_frame.add(roll)

    self
  end

  def validate_game!(component = @game)
    component.run_validations

    raise_validations!(component)

    component.children.each do |child_component|
      validate_game!(child_component)
    end
  end

  private

  def raise_validations!(component)
    error = component.errors.values.first
    raise(error[:exception], error[:error]) if error
  end

  def current_frame
    game_player.children.last
  end

  def last_frame_next?
    game_player.children.size == MAX_FRAMES - 1
  end

  def game_player
    @game.children.find do |player|
      player.id == @player_id
    end
  end
end
