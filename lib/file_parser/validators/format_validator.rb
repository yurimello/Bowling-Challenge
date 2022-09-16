module Validator
  # Implements BaseValidator and validates number range
  class FormatValidator < Validator::BaseValidator
    # Validates range for a given number
    # @param on [Symbol] the attribute o case are being validated
    # @param value [String] the value that will be validated
    # @return [Validator::StringPresenceValidator]
    def validate(on, file, allowed_format)
      file_format = file.path.split('.').last
      return self if file_format.to_s == allowed_format.to_s

      @error = "Format #{file_format} is invalid on #{on}"
      @exception = Validator::InvalidFormatError
      self
    end
  end
end
