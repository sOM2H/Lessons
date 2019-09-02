require './modules/manufacturer'
require './models/route'

class Train
  include Manufacturer

  attr_accessor :speed, :route
  attr_reader :number, :carriages

  NUMBER_FORMAT = /^(\d|[a-z]){3}-?((\d{2})|([a-z]{2}))$/.freeze

  @@instanses = {}

  def initialize(number)
    @number = number
    @route = nil
    @speed = 0
    @carriages = []
    @current_number_station = 0
    (@@instanses[number] = self) if valid?
  end

  class << self
    def find(number)
      @@instanses[number]
    end

    def all
      @@instanses
    end
  end

  def add_speed(speed = 5)
    @speed += speed
  end

  def print_speed
    puts @speed
  end

  def each_carriages
    @carriages.each { |i| yield i }
  end

  def current_station
    identify_station
  end

  def previous_station
    identify_station(-1)
  end

  def next_station
    identify_station(1)
  end

  def identify_station(number = 0)
    if route_set?
      @route.stations[@current_number_station + number]
    else
      raise_route_not_set
    end
  end

  def add_carriage(carriage)
    valid_carriage?(carriage)
    stop?
    @carriages << carriage
  end

  def delete_carriage(carriage)
    stop?
    @carriages.delete(carriage.number)
  end

  def stop
    @speed = 0
  end

  private

  def route_set?
    @route.class == Route
  end

  def stop?
    raise_not_stop unless @speed.zero?
  end

  def raise_not_stop
    raise 'Speed must equals 0.'
  end

  def raise_route_not_set
    raise 'Route not set.'
  end

  def valid?
    raise ArgumentError.new('Number format must equals', NUMBER_FORMAT) unless valid_number? @number
    raise ArgumentError.new('Number class must equals', 'String') unless @number.class == String
  end

  def valid_number?(number)
    NUMBER_FORMAT.match(number)
  end

  def valid_carriage?(carriage)
    carriage.type == type ? true : raise_not_valid_carriage
  end

  def raise_not_valid_carriage
    raise "Carriage type must equals '#{self.type}'"
  end
end
