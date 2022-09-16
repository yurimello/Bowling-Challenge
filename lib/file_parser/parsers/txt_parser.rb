require_relative './parser'

# Parses Txt spliting columns by tab
class TxtParser < Parser
  def parse(file)
    validate(:format, :file_format, file, :txt)
    file.rewind

    matrix = []
    file.readlines.each do |row|
      matrix << row.split(/\t/).map { |column| column.gsub(/(\n|\r)/, '') }
    end
    matrix
  end
end
