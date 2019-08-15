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
    @stations.each{ |s| puts.name }
    puts @last_station.name
  end

  def add_station station
    return @stations.push(station) if valid? station
    not_valid_object "Station"
  end

  def last_station? station
    return (@last_station == station) ? true : false
  end

  def first_station? station
    return (@first_station == station) ? true : false
  end

  private

  def valid? object
    return (object.class.name == "Station") ? true : false
  end

  def raise_not_valid_object object
    raise "#{object} class must equals '#{object}'."
  end

  def validate!
    raise ArgumentError.new("First station class must equals 'Station'") unless @first_station.class.name == "Station"
    raise ArgumentError.new("Last station class must equals 'Station'") unless @last_station.class.name == "Station"
  end
end
