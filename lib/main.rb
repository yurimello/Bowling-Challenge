require_relative './file_parser/file_parser'
require_relative './score_calculator/score_calculator'
require_relative './helpers/custom_logger'
# This class is client to use ten-pin bowling score calculator
class Main
  extend Callable
  include CustomLogger

  def call(file_path)
    matrix = FileParser.call(file_path)
    output = ScoreCalculator.call(matrix)
    log output

    output
  end
end
