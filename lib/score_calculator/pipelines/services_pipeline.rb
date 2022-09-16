# This class process given services in a chain
class ServicesPipeline
  extend Callable

  def call(input, services)
    services.each { |service| input = service.call(input).response }

    input
  end
end
