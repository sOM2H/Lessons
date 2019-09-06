require './modules/manufacturer'
require './modules/validation'
require './modules/accessor'
require './models/route'

class Train
  include Manufacturer
  include Acessors
  include Validation

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
    validate!
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
    @speed.zero?
  end

  def valid_carriage?(carriage)
    carriage.type == type
  end

  def raise_not_valid_carriage
end
