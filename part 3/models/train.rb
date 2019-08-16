class Train
  attr_accessor :speed, :route
  attr_reader :number, :type, :carriages

  def initialize(number, type)
    @number = number
    @route = nil
    @type = type
    @speed = 0
    @carriages = []
    @current_number_station = 0
  
    validate!
  end

  def add_speed n = 5
    @speed += n
  end

  def print_speed
    puts @speed
  end

  def current_station
    return puts route_set? ? @route.stations[@current_number_station].name : nil
    raise_route_not_set
  end

  def previous_station
    return puts route_set? ? @route.stations[@current_number_station - 1].name : nil
    raise_route_not_set
  end

  def next_station
    return puts route_set? ? @route.stations[@current_number_station + 1].name : nil
    raise_route_not_set
  end

  def add_carriage carriage
    return (@carriages << carriage) if stop? 
    raise_not_stop
  end

  def delete_carriage
    return (@carriages_count-= 1) if stop?
    raise_not_stop
  end

  def stop
    @speed = 0
  end

  private

  def route_set?
    return (@route.class.name == "Route") ? true : false
  end

  def stop?
    @speed == 0
  end

  def raise_not_stop
    raise "Speed must equals 0."
  end

  def raise_route_not_set
    raise "Route not set."
  end

  def validate!
    raise ArgumentError.new("Number class must equals 'String'") unless @number.class.name == "String"
    raise ArgumentError.new("Type class must equals 'String'") unless @type.class.name == "String"
    raise ArgumentError.new("Train type must equals 'passenger' or 'cargo'") unless @type == 'passenger' || @type == 'cargo'
  end

  def valid? carriage
    carriage.type == @type
  end
end
