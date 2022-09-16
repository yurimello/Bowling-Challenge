# This service class recieves a calculated game
# generates outpu
# responds with output stream
class GenerateOutputService < BaseService
  def call(game)
    @response = "#{header}\n"
    game.children.each do |player|
      @response << "#{player.name}\n"
      output_frames(player.children)
    end
    self
  end

  private

  def header
    ['Frame'].concat((1..10).to_a).join("\t\t")
  end

  def output_frames(frames)
    @response << "Pinfalls\t"
    frames.map(&:children).flatten.each_with_index do |roll, index|
      @response << output_roll(roll, index)
    end
    @response << "\n"
    frame_scores = frames.map(&:score).join("\t\t")
    @response << "Score\t\t#{frame_scores}\n"
  end

  def output_roll(roll, index)
    output = "#{roll.score}\t"
    return output if index >= 9

    output.gsub(/^x/i, "\tX")
  end
end
