# This service class recieves a matrix
# and maps it into a hash
# with proper format
class MapInputMatrixService < BaseService
  def call(matrix)
    validate(:array_emptiness, :matrix, matrix)
    @response = {}
    matrix.reject! { |ary| ary.first.nil? || ary.first.empty? }

    matrix.each do |row|
      player_name, score = parse_row(row)
      player = add_player(player_name)
      player.last << score
      handle_frame(player)
    end
    self
  end

  private

  def parse_row(row)
    validate(:number_range, :row, row.size, { min: 2, max: 2 })
    player_name, score = row
    validate(:string_matcher, :score, score, /(\d|f){1,2}/i)

    score = score.gsub(/( |f)/i, '0').to_i
    [player_name, score]
  end

  def add_player(player_name)
    @response[player_name] = [[]] unless @response[player_name]
    @response[player_name]
  end

  def handle_frame(player)
    return player if player.size >= MAX_FRAMES
    return player if player.last.size == 1
    return player if player.last.first < 10 && player.last.size == 2

    new_frame = [player.last.pop]
    player << new_frame
    player
  end
end
