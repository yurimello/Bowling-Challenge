# This class process given services in a chain
class ServicesPipeline
  include Callable

  def call(input, services)
    services.each { |service| input = service.call(input).response }

    input
  end
end
