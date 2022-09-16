require_relative '../helpers/callable'
require_relative '../validator/validator'
Dir[File.join(__dir__, '.', '**', '*.rb')].sort.each { |file| require file }

# Entrypoint for StoreCalculator module
class ScoreCalculator
  extend Callable

  SERVICES = [
    MapInputMatrixService,
    CreateGameService,
    CalculateScoreService,
    GenerateOutputService
  ].freeze

  def call(matrix)
    ServicesPipeline.call(matrix, SERVICES)
  end
end
