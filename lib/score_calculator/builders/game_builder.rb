# This class build and validates game
class GameBuilder
  attr_reader :game

  def initialize
    @game = GameComponent.new
  end

  def add_player(player_name)
    player = PlayerComponent.new
    player.name = player_name
    @game.add(player)
    self
  end

  def add_frame(player_name, frame_id)
    frame = last_frame_next?(player_name) ? LastFrameComponent.new : FrameComponent.new
    frame.id = frame_id
    frame.name = "Frame #{frame.id}"
    game_player(player_name).add(frame)

    self
  end

  def add_roll(player_name, score)
    roll = RollComponent.new
    roll.add(score).run_validations
    current_frame(player_name).add(roll)

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

  def current_frame(player_name)
    game_player(player_name).children.last
  end

  def last_frame_next?(player_name)
    game_player(player_name).children.size == MAX_FRAMES - 1
  end

  def game_player(player_name)
    @game.children.find do |player|
      player.name == player_name
    end
  end
end
