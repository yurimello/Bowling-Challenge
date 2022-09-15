require 'json'
require_relative './lib/score_calculator/score_calculator'
namespace :build do
  task :fixtures do
    Dir[File.join(__dir__, 'spec', 'fixtures', '**', '*.txt')].sort.each do |file| 
      file_name = file.split('.')[0..-2].join
      matrix = parse_txt_file(file)
      begin
        mapped_matrix = MapInputMatrixService.call(matrix).response  
      rescue => StandardError
        mapped_matrix = []
      end
      
      json_file = File.open("#{file_name}.json", 'w') do |f|
        f.write(mapped_matrix.to_json)
      end
      
    end
  end
end

def parse_txt_file(file_path)
  matrix = []
  File.readlines(file_path).each do |row|
    matrix << row.split(/\t/).map { |column| column.gsub(/(\n|\r)/, '') }
  end
  matrix
end
