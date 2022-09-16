require_relative './file_parser/file_parser'
require_relative './score_calculator/score_calculator'
# This class is client to use ten-pin bowling score calculator
class Main
  extend Callable

  def call(file_path)
    matrix = FileParser.call(file_path)
    ScoreCalculator.call(matrix)
  end
end
