require 'logger'
# Open logger to redefine logging
class Logger
  def format_message(_severity, _timestamp, _progname, msg)
    msg
  end
end

# Open logger to redefine log
module CustomLogger
  def log(string)
    logger = Logger.new($stdout)
    logger.level = ENV['RACK_ENV'] == 'test' ? Logger::WARN : Logger::INFO
    logger.info(string)
  end
end
