module Validator
  # Implements BaseValidator and validates number range
  class FileExistanceValidator < Validator::BaseValidator
    # Validates range for a given number
    # @param on [Symbol] the attribute o case are being validated
    # @param value [String] the value that will be validated
    # @return [Validator::StringPresenceValidator]
    def validate(file_path)
      return self if File.exist?(file_path)

      @error = "Not Found #{file_path}"
      @exception = Validator::NotFoundFileError
      self
    end
  end
end
