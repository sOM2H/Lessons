require "./modules/manufacturer"

class Train
  include Manufacturer

  attr_accessor :speed, :route
  attr_reader :number, :carriages

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
    if valid_carriage? carriage
      return (@carriages << carriage) if stop? 
      raise_not_stop
    else
      raise_not_valid_carriage
    end
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

  def valid?
    raise ArgumentError.new("Number must equals /^((\d|[a-zA-Z]){3})-?((\d|[a-zA-Z]){2})$/") unless valid_name? @number
    raise ArgumentError.new("Number class must equals 'String'") unless @number.class.name == "String"
    true
  end

  def valid_name? name
    !/^((\d|[a-zA-Z]){3})-?((\d|[a-zA-Z]){2})$/.match(name).nil?
  end

  def valid_carriage? carriage
    carriage.type == type
  end

  def raise_not_valid_carriage
    raise "Carriage type must equals '#{self.type}'"
  end
end
