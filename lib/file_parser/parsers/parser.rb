# @abstrac
class Parser
  include ParserValidator

  def parse(_file)
    raise NotImplementdError
  end
end
