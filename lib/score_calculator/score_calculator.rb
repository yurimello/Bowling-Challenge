require_relative '../helpers/callable'
require_relative '../validator/validator'
Dir[File.join(__dir__, '.', '**', '*.rb')].sort.each { |file| require file }

# Entrypoint for StoreCalculator module
class StoreCalculator
  include Callable

  SERVICES = [
    MapInputMatrixService,
    CreateGameService,
    CalculateScoreService,
    GenerateOutputService
  ].freeze

  def call(matrix)
    output = ServicesPipeline.call(matrix, SERVICES)
    p output
  end
end
