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

  def add_frame(player_name, frame_name)
    frame = last_frame_next?(player_name) ? LastFrameComponent.new : FrameComponent.new
    frame.name = frame_name
    game_player(player_name).add(frame)
    
    self
  end

  def add_roll(player_name, score)
    roll = RollComponent.new
    roll.add(score).validations
    current_frame(player_name).add(roll)
    
    self
  end

  def validate_game!(component = @game)
    raise_validations!(component)

    component.children do |child_component|
      validate_game!(child_component)
    end
  end

  private
  def raise_validations!(component)
    return true if component.valid?

    component.errors.each do |error|
      raise error.exception, error.error
    end
  end

  def current_frame(player_name)
    game_player(player_name).children.last
  end
  
  def last_frame_next?(player_name)
    game_player.children.size == MAX_FRAMES - 1
  end

  def game_player(player_name)
    @game.children.find do |player|
      player.name == player_name
    end
  end
end