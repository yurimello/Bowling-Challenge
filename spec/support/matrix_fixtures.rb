module MatrixFixtures
  def matrix_fixture(path)
    file_path = file_fixture(path)
    matrix = []
    File.readlines(file_path).each do |row|
      matrix << row.split(/\t/).map { |column| column.gsub(/(\n|\r)/, '') }
    end
    matrix
  end
end
