require './models/station'

class Route
  attr_reader :first_station, :last_station, :stations

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = []

    validate!
  end

  def print_stations
    puts @first_station.name
    @stations.each { |s| puts s.name }
    puts @last_station.name
  end

  def add_station(station)
    valid? station
    @stations.push(station)
  end

  def last_station?(station)
    @last_station == station
  end

  def first_station?(station)
    @first_station == station
  end

  private

  def valid?(object)
    raise_not_valid_statoin unless object.class == Station
  end

  def raise_not_valid_statoin
    raise "Station class must equals 'Station'."
  end

  def validate!
    raise ArgumentError.new('First station class must equals ', 'Station') unless @first_station.class == Station
    raise ArgumentError.new('Last station class must equals', 'Station') unless @last_station.class == Station
  end
end
