require_relative '../validator/validator'
Dir[File.join(__dir__, '.', '**', '*.rb')].sort.each { |file| require file }
