require_relative './txt_parser'
# Strategy for parsers
class ParserStrategy
  extend Callable
  PARSERS = {
    txt: TxtParser.new
  }.freeze

  def call(parser)
    raise MissingParser, "missing parser: #{parser}" unless PARSERS[parser]

    PARSERS[parser]
  end
end
