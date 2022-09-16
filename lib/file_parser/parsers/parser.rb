require_relative '../validators/parser_validator'
# @abstract
class Parser
  include ParserValidator

  def parse(_file); end
end
