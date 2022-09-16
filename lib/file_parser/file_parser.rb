require_relative '../helpers/callable'
require_relative '../validator/validator'
require_relative './validators/parser_validator'
Dir[File.join(__dir__, '.', '**', '*.rb')].sort.each { |file| require file }

# This class is the entry point for file parsing process
class FileParser
  extend Callable
  include ParserValidator

  def call(file_path, parser_type = :txt)
    validate(:file_exist, file_path)
    file = File.open(file_path, 'r')

    parser = ParserStrategy.call(parser_type)
    parser.parse(file)
  end
end
