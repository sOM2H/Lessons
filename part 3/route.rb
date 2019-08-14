class Route
  attr_reader :first_station, :last_station, :stations

  def initialize(first_station, last_station)
    if first_station.class.name.eql? "Station"
      @first_station = first_station
    else
      raise "First station class must equals 'Station'."
    end

    if last_station.class.name.eql? "Station"
       @last_station = last_station
    else
      raise "Last station class must equals 'Station'."
    end
    @stations = []
  end

  def print_stations
    puts @first_station.name
    @stations.each{ |s| puts.name }
    puts @last_station.name
  end

  def add_station station
    if station.class.name.eql? "Station"
      @stations.push(station)
    else
      raise "Station class must equals 'Station'."
    end
  end

  def last_station? station
    return true if @last_station.eql? station
    false
  end

  def first_station? station
    return true if @first_station.eql? station
    false
  end
end
