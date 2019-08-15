class Train
  attr_accessor :speed, :route
  attr_reader :number, :type, :carriages_count

  def initialize(number, type, carriages_count)
    @number = number
    @route = nil
    @type = type
    @speed = 0
    @carriages_count = carriages_count
    @current_number_station = 0
  end

  def print_carriages_count
    puts @carriages_count
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

  def add_carriage
    return (@carriages_count) += 1 if stop?
    raise_not_stop
  end

  def delete_carriage
    return (@carriages_count) -= 1 if stop?
    raise_not_stop
  end

  private

  def route_set?
    return (@route.class.name == "Route") ? true : false
  end

  def stop?
    return (@speed == 0) ? true : false
  end

  def raise_not_stop
    raise "Speed must equals 0."
  end

  def raise_route_not_set
    raise "Route not set."
  end
end
